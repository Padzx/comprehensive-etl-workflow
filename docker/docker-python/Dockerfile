ARG PYTHON_VERSION=3.9
FROM python:${PYTHON_VERSION}

# ----> VARS ENV <----
ARG VERSION
ARG AUTHOR

# ----> TAGS <----
LABEL version="${VERSION}"
LABEL author="${AUTHOR}"

# ---> LABELS <---
LABEL description="Docker image for creating the ETL pipeline with Airflow"
LABEL created="2024-05-18"
LABEL maintainer="${AUTHOR}"

RUN pip install apache-airflow

ENV PYTHONUNBUFFERED=1
