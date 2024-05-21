
FROM apache/airflow:latest
LABEL maintainer="Gabriel Padilha <gabriel.padzx@outlook.com>"



# ----> TAGS <-----

LABEL description="Custom Apache Airflow image"
LABEL version="1.0"
LABEL repository="https://github.com/Padzx/comprehensive-etl-workflow.git"

WORKDIR /airflow

# Install Celery and Redis to CeleryExecutor
RUN pip install 'apache-airflow[celery]' redis

# PostgreSQL location of Airflow
ENV AIRFLOW_HOME=/airflow

# UTF-8 default
ENV LANG=C.UTF-8

# Env Vars
ENV AIRFLOW__CORE__FERNET_KEY=${AIRFLOW__CORE__FERNET_KEY}
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=${AIRFLOW__CORE__SQL_ALCHEMY_CONN}


COPY ./config/airflow.cfg $AIRFLOW_HOME/airflow.cfg


COPY ./script/entrypoint.sh /entrypoint.sh

EXPOSE 8080 5555 8793

# Default command to be executed when the container starts
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]