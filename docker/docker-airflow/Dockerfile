FROM apache/airflow:latest
LABEL maintainer="Gabriel Padilha <gabriel.padzx@outlook.com>"

# Define o diretório de trabalho como /airflow
WORKDIR /airflow

# Instala o Celery e Redis para CeleryExecutor
RUN pip install 'apache-airflow[celery]' redis

# Define a localização do banco de dados PostgreSQL do Airflow
ENV AIRFLOW_HOME=/airflow

# Define a codificação UTF-8 como padrão
ENV LANG=C.UTF-8

# Define variáveis de ambiente para personalizar a configuração do Airflow
ENV AIRFLOW__CORE__FERNET_KEY=${AIRFLOW__CORE__FERNET_KEY}
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=${AIRFLOW__CORE__SQL_ALCHEMY_CONN}

# Copia o arquivo airflow.cfg para o diretório de configuração do Airflow
COPY ./config/airflow.cfg $AIRFLOW_HOME/airflow.cfg

# Copia o script de inicialização do Airflow para o diretório raiz
COPY ./script/entrypoint.sh /entrypoint.sh

EXPOSE 8080 5555 8793

# Define o comando padrão a ser executado quando o contêiner for iniciado
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]
