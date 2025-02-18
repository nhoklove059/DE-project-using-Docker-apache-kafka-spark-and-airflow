from pyspark.sql import SparkSession
from pyspark.sql.functions import col, from_json
from pyspark.sql.types import StructType, StringType
from kafka import KafkaConsumer
import json
import psycopg2

import os

os.environ["JAVA_HOME"] = "C:/Program Files/Java/jdk-11"
os.environ["PYSPARK_PYTHON"] = "C:/Users/quanghung/AppData/Local/Programs/Python/Python312/python.exe"

# Kafka & PostgreSQL Config
KAFKA_TOPIC = "thegioididong_products"
KAFKA_SERVER = "kafka:9092"  # Use Docker container name
POSTGRES_URL = "jdbc:postgresql://localhost:5432/thegioididong"
POSTGRES_USER = "admin"
POSTGRES_PASSWORD = "password"

# Define PostgreSQL Table
TABLE_NAME = "products"

# Spark Session
spark = SparkSession.builder \
    .appName("KafkaSparkStreaming") \
    .config("spark.jars.packages", "org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.1,org.postgresql:postgresql:42.5.1") \
    .getOrCreate()

# Define Kafka Consumer Schema
schema = StructType() \
    .add("name", StringType()) \
    .add("price", StringType()) \
    .add("link", StringType())

# Read data from Kafka
df = spark.readStream \
    .format("kafka") \
    .option("kafka.bootstrap.servers", KAFKA_SERVER) \
    .option("subscribe", KAFKA_TOPIC) \
    .option("startingOffsets", "earliest") \
    .load()

# Convert Kafka data from JSON
df = df.selectExpr("CAST(value AS STRING)") \
    .select(from_json(col("value"), schema).alias("data")) \
    .select("data.*")

# Write to PostgreSQL
def write_to_postgres(batch_df, batch_id):
    batch_df.write \
        .format("jdbc") \
        .option("url", POSTGRES_URL) \
        .option("dbtable", TABLE_NAME) \
        .option("user", POSTGRES_USER) \
        .option("password", POSTGRES_PASSWORD) \
        .option("driver", "org.postgresql.Driver") \
        .mode("append") \
        .save()

# Start Stream Processing
query = df.writeStream \
    .foreachBatch(write_to_postgres) \
    .outputMode("append") \
    .start()

query.awaitTermination()
