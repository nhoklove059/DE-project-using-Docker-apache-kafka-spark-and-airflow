from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from kafka import KafkaConsumer
import json
import psycopg2

# Kafka Config
KAFKA_BROKER = "localhost:9092"
TOPIC = "f1_data"

# PostgreSQL Config
DB_HOST = "localhost:5432"
DB_NAME = "fomular1"
DB_USER = "admin"
DB_PASS = "admin"

# Khởi tạo Spark Session
spark = SparkSession.builder \
    .appName("KafkaF1ETL") \
    .config("spark.jars.packages", "org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.2") \
    .getOrCreate()
    
# df.write \
#     .format("jdbc") \
#     .option("url", "jdbc:postgresql://localhost:5432/f1_data") \
#     .option("dbtable", "formula1") \
#     .option("user", "admin") \
#     .option("password", "admin") \
#     .option("driver", "org.postgresql.Driver") \
#     .mode("overwrite") \
#     .save()

# Lưu dữ liệu vào PostgreSQL
def save_to_postgres(df, table_name):
    conn = psycopg2.connect(
        host=DB_HOST, dbname=DB_NAME, user=DB_USER, password=DB_PASS
    )
    cursor = conn.cursor()

    columns = ", ".join(df.columns)
    placeholders = ", ".join(["%s"] * len(df.columns))

    for row in df.collect():
        values = tuple(row)
        cursor.execute(
            f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders}) ON CONFLICT DO NOTHING",
            values,
        )

    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Saved {len(df)} records to {table_name}")

# Lắng nghe Kafka
def consume_kafka():
    consumer = KafkaConsumer(
        TOPIC,
        bootstrap_servers=KAFKA_BROKER,
        value_deserializer=lambda x: json.loads(x.decode("utf-8")),
    )

    data_dict = {}

    for msg in consumer:
        message = msg.value
        filename = message["filename"]
        row_data = message["data"]

        table_name = filename.replace(".csv", "").lower()
        
        if table_name not in data_dict:
            data_dict[table_name] = []
        
        data_dict[table_name].append(row_data)

        if len(data_dict[table_name]) >= 1000:  # Batch size
            df = spark.createDataFrame(data_dict[table_name])
            save_to_postgres(df, table_name)
            data_dict[table_name] = []

if __name__ == "__main__":
    consume_kafka()
