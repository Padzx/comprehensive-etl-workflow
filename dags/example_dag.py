from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

def extract():
    # Código para extrair dados
    pass

def transform():
    # Código para transformar dados
    pass

def load():
    # Código para carregar dados no Data Lake (e.g., S3)
    pass

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 5, 18),
    'retries': 1,
}

with DAG(dag_id='example_etl_dag', default_args=default_args, schedule_interval='@daily', catchup=False) as dag:
    extract_task = PythonOperator(
        task_id='extract',
        python_callable=extract
    )

    transform_task = PythonOperator(
        task_id='transform',
        python_callable=transform
    )

    load_task = PythonOperator(
        task_id='load',
        python_callable=load
    )

    extract_task >> transform_task >> load_task
