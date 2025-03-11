# **📌 Real-Time Web Scraping, ETL, and Dockerized Data Pipeline for Formular 1 API**🚀

### **Objective**

In this project, we will **crawl real-time data** , process it using **ETL (Extract, Transform, Load)** techniques, store the data in a database, and build a **Dockerized**.

## Introduction

This project implements a complete data pipeline for Formula 1 racing data using Python. The pipeline crawls data from the Ergast API, sends it to Kafka, processes it with PySpark, stores it in PostgreSQL, and automates the workflow with Apache Airflow. All components are containerized using Docker, making the system easy to deploy and maintain. The final data is ready to be visualized with Power BI.

The system is designed to automatically update data on a monthly basis, ensuring your Formula 1 statistics remain current and comprehensive. This document provides a detailed guide on the project structure, setup instructions, and implementation details.

## Project Architecture

The data pipeline follows these key steps:

1. Data is crawled from the Ergast API ([https://api.jolpi.ca/ergast/](https://api.jolpi.ca/ergast/))
2. Raw data is sent to Apache Kafka for buffering and decoupling
3. PySpark reads from Kafka and performs ETL operations
4. Transformed data is stored in PostgreSQL database
5. Apache Airflow orchestrates the entire process on a monthly schedule
6. PowerBI connects to PostgreSQL for data visualization and analysis

## Project Structure

```
formula1-data-pipeline/
│
├── docker-compose.yml           # Main Docker Compose configuration
│
├── src/                         # Source code directory
│   ├── data_ingestion/          # API crawler code
│   │   ├── __init__.py
│   │   └── api_crawler.py       # Ergast API crawler implementation
│   │
│   ├── kafka_producer/          # Kafka producer code
│   │   ├── __init__.py
│   │   └── producer.py          # Kafka producer implementation
│   │
│   ├── spark_processor/         # PySpark processor code
│   │   ├── __init__.py
│   │   └── processor.py         # PySpark ETL implementation
│   │
│   └── database/                # Database utilities
│       ├── __init__.py
│       └── postgres_handler.py  # PostgreSQL handler
│
├── dags/                        # Airflow DAGs
│   └── f1_pipeline_dag.py       # Main pipeline DAG
│
├── config/                      # Configuration files
│   ├── __init__.py
│   └── settings.py              # Application settings
│
├── scripts/                     # Utility scripts
│   ├── setup_postgres.py        # Sets up PostgreSQL tables
│   └── run_spark_job.py         # Manually runs Spark job
│
├── .env.example                 # Environment variables template
├── requirements.txt             # Python dependencies
└── README.md                    # Project documentation

```

## **📌 Next Steps**

* Deploy on  **AWS (S3, EMR, Glue, Redshift)** .
* Add  **Machine Learning for Price Prediction** .
* Implement  **Delta Lake for Big Data Processing** .
