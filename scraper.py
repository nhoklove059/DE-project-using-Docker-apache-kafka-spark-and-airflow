import requests
from bs4 import BeautifulSoup
from kafka import KafkaProducer
import json
import time

# Kafka Producer Configuration
KAFKA_TOPIC = "thegioididong_products"
KAFKA_SERVER = "localhost:9092"  # Kafka running in Docker

producer = KafkaProducer(
    bootstrap_servers=KAFKA_SERVER,
    value_serializer=lambda v: json.dumps(v).encode("utf-8")
)

# URL to scrape
URL = "https://www.thegioididong.com/laptop"

def scrape_products():
    headers = {
        "User-Agent": "Mozilla/5.0"
    }
    
    response = requests.get(URL, headers=headers)
    
    if response.status_code != 200:
        print(f"Failed to fetch data: {response.status_code}")
        return
    
    soup = BeautifulSoup(response.text, "html.parser")
    products = soup.find_all("li", class_="item")

    for product in products:
        try:
            name = product.find("h3").text.strip()
            price = product.find("strong").text.strip()
            link = "https://www.thegioididong.com" + product.find("a")["href"]

            data = {
                "name": name,
                "price": price,
                "link": link
            }

            # Send data to Kafka
            producer.send(KAFKA_TOPIC, data)
            print(f"Sent to Kafka: {data}")

        except Exception as e:
            print(f"Error extracting product data: {e}")

if __name__ == "__main__":
    while True:
        print("Scraping products...")
        scrape_products()
        time.sleep(60)  # Scrape every 60 seconds
