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

# Instalar dependências do Airflow
RUN pip install apache-airflow

# Configurar variáveis de ambiente do Airflow
ENV AIRFLOW_HOME=/usr/local/airflow
ENV PYTHONUNBUFFERED=1

# Criar o diretório do Airflow
RUN mkdir -p $AIRFLOW_HOME

# Definir o diretório de trabalho
WORKDIR $AIRFLOW_HOME

# Copiar os DAGs para o diretório de trabalho
COPY dags/ $AIRFLOW_HOME/dags/

# Inicializar a base de dados do Airflow
RUN airflow db init

# Expor a porta do web server do Airflow
EXPOSE 8080

# Comando para iniciar o web server do Airflow
CMD ["airflow", "webserver", "--port", "8080"]
