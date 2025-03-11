import os
import json
import pandas as pd
from kafka import KafkaProducer
from dotenv import load_dotenv
import kaggle

# Load biến môi trường từ .env
load_dotenv()

# Thiết lập Kaggle API
os.environ["KAGGLE_USERNAME"] = os.getenv("KAGGLE_USERNAME_1")
os.environ["KAGGLE_KEY"] = os.getenv("KAGGLE_KEY_1")

# Kafka Config
KAFKA_BROKER = "localhost:9092"
TOPIC = "f1_data"

# Tải dữ liệu từ Kaggle
def download_kaggle_data():
    dataset = "rohanrao/formula-1-world-championship-1950-2020"
    kaggle.api.dataset_download_files(dataset, path="./data", unzip=True)

# Kafka Producer
def send_files_to_kafka():
    producer = KafkaProducer(
        bootstrap_servers=KAFKA_BROKER,
        value_serializer=lambda v: json.dumps(v).encode("utf-8"),
    )

    for filename in os.listdir("data"):
        if filename.endswith(".csv"):
            filepath = os.path.join("data", filename)
            df = pd.read_csv(filepath)

            for _, row in df.iterrows():
                message = {
                    "filename": filename,
                    "data": row.to_dict(),
                }
                producer.send(TOPIC, message)

            print(f"✅ Sent {len(df)} records from {filename}")

    producer.flush()

if __name__ == "__main__":
    download_kaggle_data()
    send_files_to_kafka()
