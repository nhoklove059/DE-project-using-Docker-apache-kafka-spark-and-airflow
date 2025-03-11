# pyspark/pyspark_consumer.py
from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col, to_json, struct
from pyspark.sql.types import StructType, StructField, StringType, MapType
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class F1DataProcessor:
    def __init__(self):
        self.spark = (
            SparkSession.builder.appName("F1DataETL")
            .config(
                "spark.jars.packages",
                "org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.0,"
                "org.postgresql:postgresql:42.5.1",
            )
            .getOrCreate()
        )

        self.spark.sparkContext.setLogLevel("WARN")

        # Configuration
        self.kafka_bootstrap_servers = "kafka:9092"
        self.kafka_topic = "f1_data"
        self.postgres_url = "jdbc:postgresql://postgres:5432/formula1"
        self.postgres_properties = {
            "user": "admin",
            "password": "admin",
            "driver": "org.postgresql.Driver",
        }

        # Define schema for incoming Kafka messages
        self.message_schema = StructType(
            [
                StructField("filename", StringType()),
                StructField("data", MapType(StringType(), StringType())),
            ]
        )

    def process_data_stream(self):
        try:
            # Read from Kafka
            df = (
                self.spark.readStream.format("kafka")
                .option("kafka.bootstrap.servers", self.kafka_bootstrap_servers)
                .option("subscribe", self.kafka_topic)
                .option("startingOffsets", "earliest")
                .load()
            )

            # Parse JSON from Kafka
            parsed_df = (
                df.selectExpr("CAST(value AS STRING) as json_str")
                .select(from_json("json_str", self.message_schema).alias("parsed_data"))
                .select("parsed_data.*")
            )

            # Convert the data map to a JSON string for PostgreSQL JSONB storage
            processed_df = parsed_df.select(
                col("filename"), to_json(struct("data")).alias("data")
            )

            # Write to PostgreSQL
            query = (
                processed_df.writeStream.foreachBatch(self.write_to_postgres)
                .outputMode("append")
                .start()
            )

            query.awaitTermination()

        except Exception as e:
            logger.error(f"Error in data processing: {e}")
            raise

    def write_to_postgres(self, batch_df, batch_id):
        try:
            if not batch_df.isEmpty():
                # Write to PostgreSQL with JSONB type
                batch_df.write.jdbc(
                    url=self.postgres_url,
                    table="f1_data",
                    mode="append",
                    properties=self.postgres_properties,
                )
                logger.info(f"Successfully wrote batch {batch_id}")
        except Exception as e:
            logger.error(f"Error writing batch {batch_id}: {e}")
            raise


if __name__ == "__main__":
    processor = F1DataProcessor()
    processor.process_data_stream()
