from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "start_date": datetime(2024, 1, 1),
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
    "schedule_interval": "@monthly"
}

with DAG("crawl_f1_data", default_args=default_args, schedule_interval="@monthly") as dag:

    crawl_data = BashOperator(
        task_id="crawl_data",
        bash_command="python /opt/airflow/dags/kafka/producer.py"
    )

    process_data = BashOperator(
        task_id="process_data",
        bash_command="python /opt/airflow/dags/ETL/pyspark_ETL.py"
    )

    crawl_data >> process_data
