# Use a imagem Python criada anteriormente como base
FROM padzx/python:latest

# ----> VARS ENV <----
ARG VERSION
ARG AUTHOR

# ----> TAGS <----
LABEL version="${VERSION}"
LABEL author="${AUTHOR}"

# ---> LABELS <---
LABEL description="Docker image for Apache Airflow"
LABEL created="2024-05-18"
LABEL maintainer="${AUTHOR}"


RUN pip install apache-airflow

# ----> CONFIG ENV VARS <----
ENV AIRFLOW_HOME=/usr/local/airflow
ENV PYTHONUNBUFFERED=1

RUN mkdir -p $AIRFLOW_HOME

# ----> Define Dir HOME WORK <---- 
WORKDIR $AIRFLOW_HOME

# ----> COPY DAGS TO DIR HOME <----
COPY dags/ $AIRFLOW_HOME/dags/

RUN airflow db init

EXPOSE 8080


CMD ["airflow", "webserver", "--port", "8080"]