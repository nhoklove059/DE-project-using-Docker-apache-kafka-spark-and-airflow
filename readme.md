# **📌 Real-Time Web Scraping, ETL, and Dockerized Data Pipeline for TheGioiDiDong** 🚀

### **📌 Objective**

In this project, we will **crawl real-time data** from [TheGioiDiDong](https://www.thegioididong.com/), process it using **ETL (Extract, Transform, Load)** techniques, store the data in **HDFS** or a database, and build a **Dockerized pipeline** for automation.

---

## **📌 Tech Stack**

✅ **Scrapy / Selenium / BeautifulSoup** → Web Scraping
✅ **Apache Kafka** → Real-time data ingestion
✅ **PySpark** → ETL & data transformation
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

---

# **📂 Step 4: Store Data in PostgreSQL**

### **1️⃣ Start PostgreSQL in Docker**version: '3.9'

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
