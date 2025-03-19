from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from kafka import KafkaConsumer
import json
import psycopg2

import os
os.environ["PYSPARK_PYTHON"] = "python"
os.environ["PYSPARK_DRIVER_PYTHON"] = "python"
from dotenv import load_dotenv
load_dotenv()

# Kafka Config
KAFKA_BROKER = "localhost:9092"
TOPIC = "f1_data"

# PostgreSQL Config
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASS = os.getenv("DB_PASS")

# Khởi tạo Spark Session
spark = SparkSession.builder \
    .appName("KafkaF1ETL") \
    .config("spark.jars.packages", "org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.2") \
    .getOrCreate()
    

# Lưu dữ liệu vào PostgreSQL
def save_to_postgres(df, table_name):
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASS,
            host="localhost",
            port="5432"
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
            values = tuple(None if v == "\\N" else v for v in row.asDict().values())  # Thay \N thành None
            # try:
            cursor.execute(
                f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders}) ON CONFLICT DO NOTHING",
                values,
            )
            row_count += 1
            # except Exception as row_error:
            #     print(f"❌ Lỗi khi insert row {values} vào {table_name}: {row_error}")

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
        consumer_timeout_ms=15000  # Thoát sau 15 giây nếu không có dữ liệu
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
        ["qualifying", "sprint_results", "results"],  # Nhóm 3: Phụ thuộc vào `races`
        ["lap_times", "pit_stops"],  # Nhóm 4: Phụ thuộc vào `races` và `drivers`
        ["driver_standings", "constructor_standings"]  # Nhóm 5: Phụ thuộc vào `races`, `drivers`, `constructors`
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
