# **📌 Real-Time Web Scraping, ETL, and Dockerized Data Pipeline for TheGioiDiDong** 🚀

### **📌 Objective**

In this project, we will **crawl real-time data** from [TheGioiDiDong](https://www.thegioididong.com/), process it using **ETL (Extract, Transform, Load)** techniques, store the data in **HDFS** or a database, and build a **Dockerized pipeline** for automation.

---

## **📌 Tech Stack**

✅ **Scrapy / Selenium / BeautifulSoup** → Web Scraping
✅ **Apache Kafka** → Real-time data ingestion
✅ **Apache Spark (PySpark)** → ETL & data transformation
✅ **PostgreSQL / MySQL / HDFS** → Data Storage
✅ **Apache Airflow** → Workflow Orchestration
✅ **Docker & Docker Compose** → Containerization
✅ **Power BI / Tableau** → Data Visualization

---

## **📌 Project Workflow**

1️⃣ **Web Scraping** → Crawl real-time product data from **TheGioiDiDong** (Price, Name, Brand, Ratings).
2️⃣ **Data Streaming** → Send real-time data to  **Kafka** .
3️⃣ **ETL Processing** → Process and clean the data using  **PySpark** .
4️⃣ **Data Storage** → Store data in  **PostgreSQL, MySQL, or HDFS** .
5️⃣ **Orchestration** → Use **Apache Airflow** to automate the pipeline.
6️⃣ **Visualization** → Analyze product trends using  **Power BI / Tableau** .
7️⃣ **Deployment** → Use **Docker & Docker Compose** for a fully containerized setup.

---

# **📂 Step 1: Web Scraping TheGioiDiDong Data**

### **1️⃣ Install Required Libraries**

`pip install requests beautifulsoup4 selenium scrapy kafka-python`

### **2️⃣ Setup Web Scraper (`crawler.py`)**

```python
import requests
from bs4 import BeautifulSoup
import json
from kafka import KafkaProducer
import time

# Kafka Producer
producer = KafkaProducer(bootstrap_servers="localhost:9092",
                         value_serializer=lambda v: json.dumps(v).encode("utf-8"))

# Function to scrape TheGioiDiDong data
def crawl_thegioididong():
    url = "https://www.thegioididong.com/laptop"
    headers = {"User-Agent": "Mozilla/5.0"}
  
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        print("Failed to retrieve data")
        return

    soup = BeautifulSoup(response.text, "html.parser")
    products = soup.select(".item")  # CSS selector for product items

    for product in products:
        name = product.select_one("h3").text.strip() if product.select_one("h3") else "Unknown"
        price = product.select_one(".price strong").text.strip() if product.select_one(".price strong") else "0"
        rating = product.select_one(".rating").text.strip() if product.select_one(".rating") else "N/A"

        product_data = {
            "name": name,
            "price": price.replace("₫", "").replace(".", ""),
            "rating": rating,
            "timestamp": time.strftime("%Y-%m-%d %H:%M:%S")
        }

        producer.send("thegioididong_products", product_data)
        print("Sent to Kafka:", product_data)

# Run scraper every 10 seconds
while True:
    crawl_thegioididong()
    time.sleep(10)
```

📌 **Start the Kafka Producer**

`python crawler.py`

---

# **📂 Step 2: Stream Data with Kafka**

### **1️⃣ Start Kafka & Zookeeper**

`docker-compose up -d zookeeper kafka`

### **2️⃣ Create Kafka Topic**

`docker exec -it kafka kafka-topics.sh --create --topic thegioididong_products --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1`

### **3️⃣ Start Kafka Consumer**

```python
from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
    "thegioididong_products",
    bootstrap_servers="localhost:9092",
    auto_offset_reset="earliest",
    value_deserializer=lambda x: json.loads(x.decode("utf-8"))
)

for message in consumer:
    print("Received:", message.value)

```

---

# **📂 Step 3: ETL Processing with PySpark**

### **1️⃣ Install PySpark**

`pip install pyspark`

### **2️⃣ Process Data Using PySpark (`spark_etl.py`)**

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, regexp_replace

# Initialize Spark Session
spark = SparkSession.builder.appName("ETL_TheGioiDiDong").getOrCreate()

# Read Kafka Data
df = spark.read.json("kafka://localhost:9092/thegioididong_products")

# Clean Data
df_clean = df.withColumn("price", regexp_replace(col("price"), "[^0-9]", "").cast("int"))

# Store Processed Data in PostgreSQL
df_clean.write \
    .format("jdbc") \
    .option("url", "jdbc:postgresql://localhost:5432/ecommerce") \
    .option("dbtable", "products") \
    .option("user", "admin") \
    .option("password", "password") \
    .mode("append") \
    .save()

```

---

# **📂 Step 4: Store Data in PostgreSQL**

### **1️⃣ Start PostgreSQL in Docker**

```python
version: '3.9'
services:
  postgres:
    image: postgres
    container_name: postgres_db
    restart: always
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: password
      POSTGRES_DB: ecommerce
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
volumes:
  postgres_data:

```

`docker-compose up -d postgres`

### **2️⃣ Create PostgreSQL Table**

```python
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT,
    price INT,
    rating TEXT,
    timestamp TIMESTAMP
);

```

---

# **📂 Step 5: Automate with Apache Airflow**

### **1️⃣ Install & Start Airflow**

`docker-compose up -d airflow`

### **2️⃣ Create Airflow DAG (`airflow_dag.py`)**

```python
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime

dag = DAG('thegioididong_pipeline', schedule_interval='@hourly', start_date=datetime(2024, 2, 1))

scraper_task = BashOperator(
    task_id='run_scraper',
    bash_command='python crawler.py',
    dag=dag
)

spark_task = BashOperator(
    task_id='run_spark_etl',
    bash_command='spark-submit spark_etl.py',
    dag=dag
)

scraper_task >> spark_task  # Task Dependency

```

📌 **Start Airflow Scheduler**

`airflow scheduler`

📌 **Start Airflow Web UI**

`airflow webserver`

📌 Access **[http://localhost:8080]()**

---

# **📂 Step 6: Data Visualization**

### **Connect PostgreSQL to Power BI/Tableau**

* Import `products` table and create  **dashboards** :
  * 📊 **Product Price Trends**
  * ⭐ **Top-rated products**
  * 📈 **Sales Performance by Category**

---

# **🚀 Final Deliverables**

✅ **Real-time Web Scraper for TheGioiDiDong**
✅ **Kafka Streaming Pipeline**
✅ **PySpark ETL Processing**
✅ **Data Stored in PostgreSQL**
✅ **Automated with Airflow**
✅ **Dockerized Setup**

---

## **📌 Next Steps**

* Deploy on  **AWS (S3, EMR, Glue, Redshift)** .
* Add  **Machine Learning for Price Prediction** .
* Implement  **Delta Lake for Big Data Processing** .

Would you like me to create a **GitHub repository** with all  **Docker, Airflow, Spark & Python scripts** ?
