FROM apache/airflow:latest
LABEL maintainer="Gabriel Padilha <gabriel.padzx@outlook.com>"

# Define o diretório de trabalho como /airflow
WORKDIR /airflow

# Atualiza o índice de pacotes e instala dependências adicionais
RUN apt-get update && \
    apt-get install -y \
    libpq-dev \
    python3-psycopg2 \
    && apt-get clean

# Instala o Celery e Redis para CeleryExecutor
RUN pip install 'apache-airflow[celery]' redis

# Define a localização do banco de dados PostgreSQL do Airflow
ENV AIRFLOW_HOME=/airflow

# Define a codificação UTF-8 como padrão
ENV LANG=C.UTF-8

# Define variáveis de ambiente para personalizar a configuração do Airflow
ENV AIRFLOW__CORE__FERNET_KEY=zjT6VlDV0ew8-4wJc8oM1hx8Y2PlpDs5mLH7C2Xsy0A=
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:airflow@postgres/airflow

# Copia o arquivo airflow.cfg para o diretório de configuração do Airflow
COPY ./config/airflow.cfg $AIRFLOW_HOME/airflow.cfg

# Copia o script de inicialização do Airflow para o diretório de trabalho
COPY ./script/entrypoint.sh .

# Concede permissões de execução ao script de inicialização
RUN chmod +x entrypoint.sh

# Expor a porta 8080, se necessário para acessar a interface web do Airflow
# EXPOSE 8080

# Define o comando padrão a ser executado quando o contêiner for iniciado
CMD ["./entrypoint.sh"]
