FROM apache/airflow:latest
LABEL maintainer="Gabriel Padilha <gabriel.padzx@outlook.com>"

# ----> TAGS <-----
LABEL description="Custom Apache Airflow image"
LABEL version="1.0"
LABEL repository="https://github.com/Padzx/comprehensive-etl-workflow.git"

WORKDIR /airflow

# Install Celery and Redis for CeleryExecutor
RUN pip install 'apache-airflow[celery]' redis

# Set Airflow home directory
ENV AIRFLOW_HOME=/airflow

# Set default UTF-8 encoding
ENV LANG=C.UTF-8

# Set environment variables
ENV AIRFLOW__CORE__FERNET_KEY=${AIRFLOW__CORE__FERNET_KEY}
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=${AIRFLOW__CORE__SQL_ALCHEMY_CONN}

# Copy Airflow configuration file
COPY ./config/airflow.cfg $AIRFLOW_HOME/airflow.cfg

# Copy entrypoint script
COPY ./script/entrypoint.sh /entrypoint.sh

# Copy DAGs folder
COPY ./dags $AIRFLOW_HOME/dags

EXPOSE 8080 5555 8793

# Set default command to be executed when the container starts
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]
