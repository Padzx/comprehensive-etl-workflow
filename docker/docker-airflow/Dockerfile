# Author: Gabriel Padilha <Padzx>

FROM apache/airflow:latest
LABEL maintainer="Gabriel Padilha <gabriel.padzx@outlook.com>"

# ------> Tags <------
LABEL description="Custom Apache Airflow image"
LABEL version="1.0"
LABEL repository="https://github.com/Padzx/comprehensive-etl-workflow.git"

WORKDIR /airflow

# ------> Install Celery and Redis for CeleryExecutor <------
RUN pip install 'apache-airflow[celery]' redis

# ------> Copy requirements.txt and install dependencies <------
COPY requirements.txt /airflow/requirements.txt
RUN pip install --no-cache-dir -r /airflow/requirements.txt

ENV AIRFLOW_HOME=/airflow
ENV LANG=C.UTF-8
ENV AIRFLOW__CORE__FERNET_KEY=${AIRFLOW__CORE__FERNET_KEY}
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=${AIRFLOW__CORE__SQL_ALCHEMY_CONN}

# ------> Copy the configuration files <------
COPY ./config/airflow.cfg /airflow/airflow.cfg
COPY ./script/entrypoint.sh /entrypoint.sh

# ------> Expose necessary ports <------
EXPOSE 8080 5555 8793

# ------> Set the entrypoint and default command <------
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"] 