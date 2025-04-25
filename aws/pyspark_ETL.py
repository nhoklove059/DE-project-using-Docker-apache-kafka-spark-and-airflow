import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from kafka import KafkaConsumer  # Giữ lại nếu bạn muốn dùng KafkaConsumer Python
import json
import psycopg2
import os
import time


# Lấy tham số job (nếu có)
args = getResolvedOptions(
    sys.argv,
    ["JOB_NAME", "KAFKA_BROKER", "RDS_ENDPOINT", "DB_NAME", "DB_USER", "DB_PASS"],
)

# Khởi tạo Glue Context và Spark Session
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# --- BẮT ĐẦU CODE CỦA BẠN ---
# Kafka Config (lấy từ tham số job)
KAFKA_BROKER = args["KAFKA_BROKER"]
TOPIC = "f1_data"

# PostgreSQL Config (lấy từ tham số job)
DB_HOST = args["f1-databases.c7gm66c2gngx.ap-south-1.rds.amazonaws.com"]
DB_PORT = "5432"
DB_NAME = args["f1_database"]
DB_USER = args["postgresadmin"]
DB_PASS = args["postgresadmin"]


# Hàm save_to_postgres (giữ nguyên, nhưng sửa host trong connect)
def save_to_postgres(df, table_name):
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASS,
            host=DB_HOST,  # Sửa thành RDS Endpoint
            port=DB_PORT,
        )
        cursor = conn.cursor()
        # Kiểm tra bảng có tồn tại không
        cursor.execute(f"SELECT to_regclass('{table_name}');")
        result = cursor.fetchone()
        if result[0] is None:
            print(f"❌ Table {table_name} does not exist. Skipping insert.")
            conn.close()
            return

        columns = ", ".join(df.columns)
        placeholders = ", ".join(["%s"] * len(df.columns))

        row_count = 0
        for row in df.rdd.collect():
            values = tuple(
                None if v in ["\\N", "NaN", ""] else v for v in row.asDict().values()
            )  # Xử lý NaN
            try:
                cursor.execute(
                    f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders}) ON CONFLICT DO NOTHING",
                    values,
                )
                row_count += 1
            except Exception as row_error:
                print(f"❌ Lỗi khi insert row {values} vào {table_name}: {row_error}")

        conn.commit()
        cursor.close()
        conn.close()
        print(f"✅ Đã lưu {row_count} dòng vào {table_name}")
    except Exception as e:
        print(f"❌ Lỗi khi ghi vào {table_name}: {e}")


# Lắng nghe Kafka và lưu dữ liệu theo thứ tự
def consume_kafka():
    print("🔄 Đang kết nối tới Kafka...")
    consumer = KafkaConsumer(
        TOPIC,
        bootstrap_servers=KAFKA_BROKER,
        value_deserializer=lambda x: json.loads(x.decode("utf-8")),
        auto_offset_reset="earliest",
        consumer_timeout_ms=15000,
    )

    print("✅ Kết nối Kafka thành công. Đang chờ dữ liệu...")

    data_dict = {}

    for msg in consumer:
        message = msg.value
        filename = message["filename"]
        row_data = message["data"]

        table_name = filename.replace(".csv", "").lower()

        if table_name not in data_dict:
            data_dict[table_name] = []

        data_dict[table_name].append(row_data)

    if not data_dict:
        print("⚠️ Không có dữ liệu mới từ Kafka. Dừng chương trình.")
    else:
        insert_data_in_order(data_dict)

import time
def insert_data_in_order(data_dict):
    """
    Chèn dữ liệu theo thứ tự để tránh lỗi khóa ngoại.
    """
    table_priority = [
        ["circuits", "constructors", "drivers", "seasons", "status"],  # Nhóm 1: Không có khóa ngoại
        ["races"],  # Nhóm 2: Phụ thuộc vào nhóm 1
        ["qualifying", "results"],  # Nhóm 3: Phụ thuộc vào `races`
        ["lap_times", "pit_stops", "sprint_results"],  # Nhóm 4: Phụ thuộc vào `races` và `drivers`, `results`
        ["driver_standings"], # Nhóm 5: Phụ thuộc vào `races`, `drivers`, `constructors`
        ["constructor_standings", "constructor_results"]  
    ]

    for group in table_priority:
        for table in group:
            if table in data_dict and data_dict[table]:
                df = spark.createDataFrame(data_dict[table])
                save_to_postgres(df, table)
                print(f"✅ Inserted {len(data_dict[table])} rows into {table}")

                # Nếu vừa insert xong `races`, chờ 5 giây để đảm bảo dữ liệu được commit trước khi các bảng khác insert
                if table == "races":
                    print("⏳ Chờ 5 giây để đảm bảo dữ liệu races đã commit trước khi tiếp tục...")
                    time.sleep(5)

if __name__ == "__main__":
    consume_kafka()

job.commit()
