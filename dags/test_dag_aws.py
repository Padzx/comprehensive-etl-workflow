from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
import pandas as pd
import boto3

# Configuração das variáveis de conexão
AWS_S3_BUCKET = 'airflow-etl-data'
AWS_REGION = 'us-east-1'

def create_dataframe():
    # Criando um DataFrame simples
    data = {
        'col1': [1, 2, 3, 4],
        'col2': ['a', 'b', 'c', 'd']
    }
    df = pd.DataFrame(data)
    df.to_csv('/tmp/data.csv', index=False)

def upload_to_s3():
    # Criando um cliente S3
    s3_client = boto3.client('s3', region_name=AWS_REGION)
    s3_client.upload_file('/tmp/data.csv', AWS_S3_BUCKET, 'data.csv')

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    'etl_to_s3_dag',
    default_args=default_args,
    description='A simple ETL DAG that exports data to S3',
    schedule_interval=timedelta(days=1),
    start_date=datetime(2023, 1, 1),
    catchup=False,
) as dag:

    create_dataframe_task = PythonOperator(
        task_id='create_dataframe',
        python_callable=create_dataframe,
    )

    upload_to_s3_task = PythonOperator(
        task_id='upload_to_s3',
        python_callable=upload_to_s3,
    )

    create_dataframe_task >> upload_to_s3_task
