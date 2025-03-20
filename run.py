import subprocess
import time

def run_script(command, wait_time=2):
    """Chạy lệnh terminal trong một process riêng."""
    process = subprocess.Popen(command, shell=True)
    time.sleep(wait_time)  # Chờ một chút để đảm bảo script chạy ổn định
    return process

if __name__ == "__main__":
    print("🚀 Khởi động Kafka Producer...")
    producer_process = run_script("python ./kafka/producer.py")

    print("🛠  Chờ 5 giây để Producer gửi dữ liệu vào Kafka...")
    time.sleep(5)  # Đợi Producer chạy trước

    print("⚡ Khởi động PySpark ETL Consumer...")
    etl_process = run_script("python ./ETL/pyspark_ETL.py")

    print("✅ Pipeline đang chạy... Nhấn Ctrl + C để dừng.")

    try:
        producer_process.wait()
        etl_process.wait()
    except KeyboardInterrupt:
        print("\n🛑 Dừng Pipeline...")
        producer_process.terminate()
        etl_process.terminate()
