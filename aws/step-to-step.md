Tổng quan kiến trúc trên AWS
Chúng ta sẽ chuyển đổi kiến trúc Docker Compose cục bộ của bạn sang các dịch vụ AWS tương ứng:

EC2 Instance (t2.micro - Free Tier): Sẽ chạy Zookeeper và Apache Kafka để nhận dữ liệu streaming.

RDS for PostgreSQL (db.t2.micro - Free Tier): Sẽ lưu trữ cơ sở dữ liệu f1_database của bạn.

AWS Glue: Sẽ chạy script PySpark pyspark_ETL.py để xử lý dữ liệu từ Kafka và ghi vào RDS.

S3: (Tùy chọn nhưng khuyến nghị) Để lưu trữ script Glue và các tệp phụ thuộc.

IAM Roles: Để cấp quyền an toàn cho các dịch vụ AWS tương tác với nhau.

Bước 1: Thiết lập EC2 cho Kafka và Zookeeper
1.1. Khởi tạo EC2 Instance (Free Tier)
Truy cập AWS Console: Đăng nhập và điều hướng đến dịch vụ EC2.

Launch Instance: Nhấp vào "Launch instances".

Đặt tên: Đặt tên cho instance, ví dụ f1-kafka-server.

Chọn AMI: Chọn "Ubuntu" (hoặc "Amazon Linux 2"). Đảm bảo chọn phiên bản có nhãn "Free tier eligible".

Chọn Instance Type: Chọn t2.micro (Free tier eligible).

Key pair (login):

Tạo một key pair mới (ví dụ: f1-kafka-key) hoặc chọn một key pair hiện có.

Chọn định dạng .pem.

Tải file .pem về máy tính của bạn và giữ an toàn.

Network settings (Security Group):

Nhấp "Edit" bên cạnh Network settings.

Chọn "Create security group".

Đặt tên (ví dụ: f1-kafka-sg).

Thêm các Inbound security group rules sau:

Rule 1 (SSH): Type: SSH, Port: 22, Source: My IP (để chỉ bạn có thể SSH) hoặc Anywhere 0.0.0.0/0 (cho mục đích thử nghiệm, kém an toàn).

Rule 2 (Kafka): Type: Custom TCP, Port: 9092, Source: Anywhere 0.0.0.0/0 (Để producer và Glue có thể kết nối). Trong môi trường production, bạn nên giới hạn source là VPC hoặc IP cụ thể.

Rule 3 (Zookeeper): Type: Custom TCP, Port: 2181, Source: Custom và chọn chính Security Group này (ví dụ: f1-kafka-sg) để chỉ instance trong cùng SG mới kết nối được ZK, hoặc Anywhere nếu cần thiết.

Storage: Giữ cấu hình mặc định của Free Tier (thường là 8GB hoặc 30GB gp2/gp3).

Launch instance: Nhấp vào nút "Launch instance". Chờ vài phút để instance khởi chạy.

Lấy Public IP/DNS: Chọn instance vừa tạo trong danh sách EC2 và sao chép giá trị "Public IPv4 address" hoặc "Public IPv4 DNS". Bạn sẽ dùng nó để kết nối SSH và cấu hình Kafka.

1.2. Kết nối SSH và Cài đặt
Kết nối SSH: Mở terminal trên máy của bạn và kết nối:

bash

# Đặt quyền phù hợp cho key

chmod 400 /path/to/your/f1-kafka-key.pem

# Kết nối (thay bằng Public IP/DNS của bạn)

ssh -i /path/to/your/f1-kafka-key.pem ubuntu@YOUR_EC2_PUBLIC_IP_OR_DNS

# Hoặc ec2-user@... nếu dùng Amazon Linux

Cài đặt Java (JDK 11): Kafka yêu cầu Java.

bash

# Đối với Ubuntu

sudo apt update
sudo apt install -y openjdk-11-jdk # Cài JDK 11 như bạn đã dùng

# Đối với Amazon Linux 2

# sudo amazon-linux-extras install java-openjdk11 -y

# Kiểm tra cài đặt

java -version

# Thiết lập JAVA_HOME (thường tự động, nhưng kiểm tra nếu cần)

# echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc # Đường dẫn có thể khác

# source ~/.bashrc

Tải và Giải nén Kafka:

bash

# Tải phiên bản phù hợp (ví dụ 3.1.2 như trong code Glue của bạn)

wget https://archive.apache.org/dist/kafka/3.1.2/kafka_2.13-3.1.2.tgz
tar -xzf kafka_2.13-3.1.2.tgz
cd kafka_2.13-3.1.2
1.3. Cấu hình Kafka cho Free Tier (t2.micro)
t2.micro có bộ nhớ rất hạn chế (1GB RAM). Cấu hình Kafka mặc định sẽ thất bại.

Giảm bộ nhớ Heap cho Kafka:

Mở file script khởi động Kafka:

bash
nano bin/kafka-server-start.sh
Tìm dòng export KAFKA_HEAP_OPTS="..." (thường là -Xmx1G -Xms1G).

Thay đổi thành giá trị nhỏ hơn nhiều:

bash
export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"

# Hoặc thậm chí nhỏ hơn nếu cần: -Xmx128M -Xms64M

Lưu file (Ctrl+X, Y, Enter).

(Tùy chọn) Giảm bộ nhớ Heap cho Zookeeper: Nếu Zookeeper cũng gặp vấn đề hoặc để tiết kiệm thêm RAM:

Cách 1: Mở bin/zookeeper-server-start.sh và sửa đổi KAFKA_HEAP_OPTS tương tự.

Cách 2: Thêm vào ~/.bashrc và chạy source ~/.bashrc:

bash
echo 'export KAFKA_HEAP_OPTS="-Xmx128M -Xms64M"' >> ~/.bashrc # Áp dụng cho cả ZK khi chạy từ terminal này

# Hoặc export ZK_SERVER_HEAP=128 ZK_CLIENT_HEAP=64 (biến riêng của ZK)

source ~/.bashrc
Cấu hình server.properties:

Mở file cấu hình Kafka:

bash
nano config/server.properties
Quan trọng: Tìm dòng #advertised.listeners=PLAINTEXT://your.host.name:9092

Bỏ dấu # ở đầu và thay your.host.name bằng Public DNS (hoặc Public IP) của EC2 instance:

text
advertised.listeners=PLAINTEXT://YOUR_EC2_PUBLIC_DNS:9092
(Tùy chọn) Bạn có thể thay đổi log.dirs nếu muốn lưu log ở vị trí khác.

Lưu file (Ctrl+X, Y, Enter).

1.4. Khởi chạy Zookeeper và Kafka
Mở hai cửa sổ terminal SSH riêng biệt kết nối đến cùng EC2 instance.

Terminal 1 (Zookeeper):

bash
cd kafka_2.13-3.1.2 # Đi vào thư mục Kafka
bin/zookeeper-server-start.sh config/zookeeper.properties
Terminal 2 (Kafka Server):

bash
cd kafka_2.13-3.1.2 # Đi vào thư mục Kafka
bin/kafka-server-start.sh config/server.properties
Nếu khởi động thành công mà không báo lỗi bộ nhớ, bạn đã hoàn thành phần Kafka trên EC2.

(Tùy chọn - Tạo Topic): Mở terminal thứ 3 hoặc dừng Kafka tạm thời để tạo topic:

bash
cd kafka_2.13-3.1.2
bin/kafka-topics.sh --create --topic f1_data --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1

# Sau đó khởi động lại Kafka nếu đã dừng

Bước 2: Thiết lập RDS PostgreSQL (Free Tier)
2.1. Tạo RDS Instance
Truy cập AWS Console: Điều hướng đến dịch vụ RDS.

Create database: Nhấp vào nút "Create database".

Choose creation method: Chọn "Standard create".

Engine options: Chọn "PostgreSQL".

Templates: Rất quan trọng: Chọn "Free tier".

Settings:

DB instance identifier: Đặt tên định danh, ví dụ f1-database.

Master username: Đặt tên người dùng chính, ví dụ postgresadmin (ghi nhớ tên này).

Master password: Đặt mật khẩu mạnh và ghi nhớ cẩn thận.

Instance configuration: Đảm bảo db.t2.micro được chọn.

Storage: Giữ nguyên cài đặt Free Tier (20 GiB, General Purpose SSD gp2/gp3). Quan trọng: Bỏ chọn "Enable storage autoscaling" để tránh phát sinh chi phí.

Connectivity:

Virtual private cloud (VPC): Chọn VPC mặc định hoặc VPC mà EC2 instance của bạn đang ở trong đó.

DB subnet group: Thường để mặc định hoặc tạo mới nếu cần.

Public access: Chọn "Yes". Điều này cần thiết để Glue Job (chạy bên ngoài VPC của bạn ban đầu) và bạn có thể kết nối từ máy local để tạo schema. Để bảo mật hơn trong production, nên đặt là "No" và cấu hình VPC Endpoint cho Glue/EC2.

VPC security group: Chọn "Create new" hoặc chọn một SG hiện có. Nếu tạo mới, đặt tên dễ nhớ (ví dụ: f1-rds-sg). Chúng ta sẽ cấu hình nó sau.

Database port: Giữ nguyên 5432.

Database authentication: Chọn "Password authentication".

Additional configuration (Quan trọng): Mở rộng mục này.

Initial database name: Nhập tên database bạn muốn tạo sẵn, chính là f1_database (theo file docker-compose.yml). Nếu bạn không nhập ở đây, bạn sẽ phải tạo nó thủ công sau khi kết nối.

Create database: Nhấp "Create database" và đợi vài phút cho instance sẵn sàng (trạng thái "Available").

2.2. Cấu hình Security Group cho RDS
Tìm RDS Security Group: Vào chi tiết RDS instance vừa tạo, tab "Connectivity & security". Nhấp vào link trong mục "VPC security groups" (tên bạn đặt, ví dụ f1-rds-sg).

Edit Inbound Rules: Chọn Security Group đó, vào tab "Inbound rules", nhấp "Edit inbound rules".

Add Rule:

Type: Chọn PostgreSQL. Port 5432 sẽ tự điền.

Source: Chọn Custom và nhập vào Security Group ID của EC2 instance (f1-kafka-sg). Điều này cho phép Kafka EC2 kết nối RDS (nếu cần).

Add Rule (thứ hai):

Type: PostgreSQL.

Source: Chọn My IP để cho phép bạn kết nối từ máy local tạo schema.

Add Rule (thứ ba - cho Glue):

Type: PostgreSQL.

Source: Chọn Anywhere IPv4 (0.0.0.0/0) HOẶC nếu bạn muốn chặt chẽ hơn, tạo một Security Group riêng cho Glue Job và thêm ID của nó vào đây (cần cấu hình khi tạo Glue Job). Tạm thời dùng Anywhere cho đơn giản.

Save rules.

2.3. Tạo Schema (Bảng) trong RDS
Vì PostgreSQL không tự tạo bảng, bạn cần tạo chúng trước khi chạy ETL.

Lấy RDS Endpoint: Trong tab "Connectivity & security" của RDS instance, sao chép giá trị "Endpoint".

Kết nối bằng psql (từ máy local):

bash
psql --host=YOUR_RDS_ENDPOINT --port=5432 --username=postgresadmin --password --dbname=f1_database
(Thay YOUR_RDS_ENDPOINT bằng endpoint bạn vừa copy, postgresadmin bằng master username bạn đặt. Nhập mật khẩu khi được hỏi)

Chạy lệnh CREATE TABLE: Dán và chạy lần lượt các lệnh CREATE TABLE cho tất cả các bảng của bạn (circuits, constructors, drivers, races, results, etc.) với đúng cấu trúc cột và kiểu dữ liệu như bạn đã dùng trong môi trường Docker.

sql
-- Ví dụ:
CREATE TABLE circuits (
    circuitId INT PRIMARY KEY,
    circuitRef VARCHAR(255),
    name VARCHAR(255),
    location VARCHAR(255),
    country VARCHAR(255),
    lat FLOAT,
    lng FLOAT,
    alt INT,
    url VARCHAR(255) UNIQUE
);

CREATE TABLE constructors (
    -- Định nghĩa các cột cho bảng constructors
    -- ...
);

-- Tạo tất cả các bảng còn lại...
Kiểm tra bằng lệnh \dt trong psql để xem danh sách các bảng đã tạo.

Thoát psql bằng \q.

Bước 3: Thiết lập AWS Glue cho PySpark ETL
3.1. Chuẩn bị Script và Dependencies
Tạo S3 Bucket:

Vào AWS Console -> S3 -> Create bucket.

Đặt tên bucket (ví dụ: f1-glue-assets-yourname).

Chọn Region giống với EC2 và RDS.

Giữ các cài đặt khác mặc định và tạo bucket.

Sửa đổi Script pyspark_ETL.py cho Glue:

Tạo một bản sao của file pyspark_ETL.py (ví dụ: glue_pyspark_ETL.py).

Thêm thư viện Glue và lấy tham số:

python
import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Bỏ dòng from pyspark.sql import SparkSession (Glue sẽ cung cấp)

# ... các import khác giữ nguyên ...

# Lấy các tham số được truyền vào từ Glue Job

args = getResolvedOptions(sys.argv,
                          ['JOB_NAME',
                           'KAFKA_BROKERS', # Đổi tên cho rõ ràng
                           'RDS_ENDPOINT',
                           'DB_NAME',
                           'DB_USER',
                           'DB_PASS'])

# Khởi tạo Glue Context và Spark Session

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# --- BẮT ĐẦU CODE CỦA BẠN (sửa đổi cấu hình) ---

# Kafka Config (Lấy từ tham số Glue)

KAFKA_BROKER = args['KAFKA_BROKERS'] # Sử dụng tham số
TOPIC = "f1_data"

# PostgreSQL Config (Lấy từ tham số Glue)

DB_HOST = args['RDS_ENDPOINT']      # Sử dụng tham số
DB_PORT = "5432" # Thường cố định
DB_NAME = args['DB_NAME']           # Sử dụng tham số
DB_USER = args['DB_USER']           # Sử dụng tham số
DB_PASS = args['DB_PASS']           # Sử dụng tham số

# Bỏ các dòng os.environ và load_dotenv không cần thiết trong Glue

# Bỏ phần khởi tạo SparkSession thủ công

Cập nhật hàm save_to_postgres: Đảm bảo host=DB_HOST và port=DB_PORT sử dụng các biến đã lấy từ args.

python

# Trong hàm save_to_postgres:

conn = psycopg2.connect(
    dbname=DB_NAME,
    user=DB_USER,
    password=DB_PASS,
    host=DB_HOST, # Đảm bảo dùng biến DB_HOST
    port=DB_PORT  # Đảm bảo dùng biến DB_PORT
)
Cập nhật hàm consume_kafka: Thay KafkaConsumer bằng cách đọc từ Kafka DataFrame của Spark SQL (cách này tích hợp tốt hơn với Glue).

python
def consume_and_process_kafka():
    print("🔄 Đang đọc dữ liệu từ Kafka stream...")

    # Đọc dữ liệu từ Kafka bằng Spark Structured Streaming hoặc Batch
    # Ví dụ đọc Batch (chạy một lần khi job trigger)
    kafka_df = spark.read
    .format("kafka")
    .option("kafka.bootstrap.servers", KAFKA_BROKER)
    .option("subscribe", TOPIC)
    .option("startingOffsets", "earliest") # Đọc từ đầu cho lần chạy đầu
        # .option("endingOffsets", "latest") # Xử lý đến dữ liệu mới nhất
        .load()

    print("✅ Đọc dữ liệu từ Kafka thành công.")

    # Decode giá trị từ binary sang string và parse JSON
    # Giả định schema của message JSON trong Kafka
    from pyspark.sql.types import StructType, StructField, StringType, MapType
    from pyspark.sql.functions import from_json, col

    json_schema = StructType([
        StructField("filename", StringType(), True),
        StructField("data", MapType(StringType(), StringType()), True) # Giả sử data là map string:string
    ])

    parsed_df = kafka_df.select(
        from_json(col("value").cast("string"), json_schema).alias("parsed_value")
    ).select("parsed_value.*") # Lấy ra filename và data

    # Phân loại dữ liệu theo tên bảng
    # Code này cần điều chỉnh để hoạt động với DataFrame thay vì dict
    # Cách tiếp cận: Lọc DataFrame cho từng tên bảng và gọi insert_data_in_order

    distinct_tables = parsed_df.select("filename").distinct().rdd.flatMap(lambda x: x).collect()
    print(f"Các bảng tìm thấy trong batch: {distinct_tables}")

    data_by_table = {}
    for table_file in distinct_tables:
        table_name = table_file.replace(".csv", "").lower()
        # Lọc dữ liệu cho bảng hiện tại
        table_df = parsed_df.filter(col("filename") == table_file).select("data")

    # Chuyển đổi MapType thành các cột riêng biệt nếu cần, hoặc chuẩn bị để insert
        # Bước này phức tạp, cần biết rõ schema của từng file CSV
        # Tạm thời giả định bạn sẽ xử lý table_df trong insert_data_in_order
        print(f"Chuẩn bị dữ liệu cho bảng: {table_name}")
        # Bạn cần chuyển đổi table_df (chứa cột 'data' là Map) thành DataFrame có schema giống bảng đích
        # Đây là phần phức tạp nhất cần điều chỉnh dựa trên schema thực tế
        # Ví dụ đơn giản (cần làm phức tạp hơn cho đúng schema):
        # flat_df = table_df.selectExpr("data['col1'] as col1", "data['col2'] as col2", ...)
        # data_by_table[table_name] = flat_df # Lưu DataFrame đã xử lý

    # --> Cần viết lại hàm insert_data_in_order để nhận DataFrame thay vì dict
    # insert_data_in_order_for_glue(data_by_table)
    print("⚠️ Phần xử lý và insert DataFrame cần được hoàn thiện dựa trên schema cụ thể!")

# --> Cần viết lại hàm insert_data_in_order để làm việc với DataFrame

# def insert_data_in_order_for_glue(data_frames_dict):

# table_priority = [...] # Giữ nguyên thứ tự

# for group in table_priority:

# for table in group:

# if table in data_frames_dict:

# df_to_save = data_frames_dict[table]

# if df_to_save and not df_to_save.isEmpty():

# save_to_postgres(df_to_save, table) # Hàm save_to_postgres có thể cần sửa nhẹ để nhận DataFrame trực tiếp

# print(f"✅ Inserted data into")

# if table == "races":

# print("⏳ Chờ 5 giây...")

# time.sleep(5)

# Thay đổi điểm bắt đầu script

if __name__ == "__main__":
    consume_and_process_kafka() # Gọi hàm mới
    job.commit() # Commit Glue job
Lưu ý quan trọng: Việc chuyển từ xử lý dict sang xử lý DataFrame trong consume_and_process_kafka và insert_data_in_order_for_glue là phần phức tạp nhất và cần điều chỉnh cẩn thận dựa trên cấu trúc dữ liệu JSON và schema các bảng PostgreSQL của bạn. Đoạn code trên chỉ là khung sườn.

Thêm commit job: Đảm bảo có dòng job.commit() ở cuối phần if __name__ == "__main__":.

Upload Script lên S3: Tải file glue_pyspark_ETL.py đã sửa đổi lên bucket S3 bạn đã tạo (ví dụ: vào thư mục scripts/).

3.2. Tạo IAM Role cho Glue
Truy cập IAM Console: Vào dịch vụ IAM.

Roles -> Create role.

Trusted entity type: Chọn "AWS service".

Use case: Chọn "Glue".

Permissions: Attach các policy sau:

AWSGlueServiceRole (mặc định).

AmazonS3FullAccess (Hoặc giới hạn chỉ cho bucket f1-glue-assets-yourname).

AmazonRDSFullAccess (Hoặc tạo policy chặt chẽ hơn chỉ cho phép kết nối RDS instance f1-database).

CloudWatchLogsFullAccess (Để xem log Glue job).

Đặt tên Role: Ví dụ: f1-glue-etl-role. Tạo Role.

3.3. Tạo Glue Job
Truy cập AWS Glue Console: Vào dịch vụ Glue.

ETL jobs -> Spark script editor -> Create.

Job details:

Name: Đặt tên job, ví dụ f1-kafka-rds-etl.

IAM Role: Chọn Role bạn vừa tạo (f1-glue-etl-role).

Type: Spark.

Glue version: Chọn "Glue 4.0" (hỗ trợ Spark 3.3+) hoặc phiên bản phù hợp với PySpark 3.5.x nếu có.

Language: Python 3.

Worker type: Chọn G.1X (1 DPU) để tiết kiệm chi phí ban đầu.

Requested number of workers: Bắt đầu với 2 hoặc 3.

Job timeout (minutes): Đặt giới hạn thời gian (ví dụ: 60).

Script:

Script location: Trỏ đến đường dẫn S3 của file glue_pyspark_ETL.py (ví dụ: s3://f1-glue-assets-yourname/scripts/glue_pyspark_ETL.py).

Advanced properties -> Job parameters (Rất quan trọng): Thêm các key-value sau:

Key: --KAFKA_BROKERS | Value: YOUR_EC2_PUBLIC_DNS:9092 (Thay bằng DNS của EC2 Kafka)

Key: --RDS_ENDPOINT | Value: YOUR_RDS_ENDPOINT (Thay bằng Endpoint của RDS)

Key: --DB_NAME | Value: f1_database

Key: --DB_USER | Value: postgresadmin (Hoặc master user bạn đặt)

Key: --DB_PASS | Value: YOUR_RDS_PASSWORD (Lưu ý: Truyền mật khẩu trực tiếp không an toàn. Nên dùng AWS Secrets Manager trong môi trường thực tế).

Key: --additional-python-modules | Value: psycopg2-binary==2.9.3,kafka-python==2.0.2 (Điều chỉnh phiên bản nếu cần).

Key: --conf | Value: spark.driver.extraJavaOptions=-Dio.netty.tryReflectionSetAccessible=true --conf spark.executor.extraJavaOptions=-Dio.netty.tryReflectionSetAccessible=true (Để tương thích JDK 11/17).

Key: --jars | Value: org.postgresql:postgresql:42.3.4 (Thêm JDBC driver cho PostgreSQL, kiểm tra phiên bản mới nhất). Lưu ý: Không cần spark-sql-kafka ở đây vì nó thường được tích hợp sẵn trong Glue/Spark runtime.

Save Job.

Bước 4: Cập nhật và Chạy Producer
Sửa đổi producer.py:

Mở file producer.py trên máy local của bạn.

Thay đổi dòng KAFKA_BROKER:

python

# Thay localhost bằng Public DNS của EC2

KAFKA_BROKER = "YOUR_EC2_PUBLIC_DNS:9092"
Chạy Producer:

Đảm bảo Zookeeper và Kafka đang chạy trên EC2.

Mở terminal trên máy local, điều hướng đến thư mục chứa producer.py và file .env (chứa KAGGLE credentials).

Chạy producer:

bash
python producer.py
Producer sẽ tải dữ liệu từ Kaggle và gửi đến Kafka topic trên EC2 instance.

Bước 5: Chạy Glue Job và Quản lý
Run Glue Job:

Vào AWS Glue Console -> ETL jobs.

Chọn job f1-kafka-rds-etl bạn đã tạo.

Nhấp vào "Run".

Theo dõi Job:

Bạn có thể theo dõi trạng thái job trong tab "Runs".

Nhấp vào Run ID để xem chi tiết, bao gồm Logs (trong CloudWatch) để gỡ lỗi nếu cần.

Kiểm tra Dữ liệu RDS: Sau khi Glue job chạy xong (trạng thái "Succeeded"), kết nối lại vào RDS bằng psql và kiểm tra xem dữ liệu đã được ghi vào các bảng hay chưa.

Bước 6: Lưu ý về Free Tier và Chi phí
EC2 & RDS: Miễn phí trong giới hạn 750 giờ/tháng cho t2.micro trong 12 tháng đầu. Vượt quá sẽ bị tính phí.

AWS Glue: Không hoàn toàn miễn phí. Bạn trả tiền theo DPU-giờ. Job chạy càng lâu, dùng càng nhiều worker (DPU) thì càng tốn kém. Chạy job với G.1X và ít worker sẽ rẻ hơn. Theo dõi chi phí chặt chẽ.

Data Transfer: Có thể phát sinh chi phí nếu truyền dữ liệu nhiều giữa các AZ hoặc ra ngoài internet.

Bước 7: Dọn dẹp (Quan trọng)
Khi không sử dụng nữa, hãy xóa tài nguyên để tránh phát sinh chi phí:

Dừng/Xóa Glue Job: Dừng các lần chạy và xóa định nghĩa Job.

Xóa RDS Instance: Vào RDS Console, chọn instance -> Actions -> Delete. (Có thể cần tắt Deletion Protection trước).

Terminate EC2 Instance: Vào EC2 Console, chọn instance -> Instance state -> Terminate instance.

Xóa S3 Bucket: Xóa bucket chứa script Glue.

Xóa Security Groups: Xóa các SG đã tạo (f1-kafka-sg, f1-rds-sg) nếu không dùng nữa.

Xóa IAM Role: Xóa Role f1-glue-etl-role nếu không cần.

Xóa Key Pair: Xóa key pair EC2 nếu không dùng.
