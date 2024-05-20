# Use a imagem base do Python 3.9
FROM python:3.9

# Defina o diretório de trabalho como /usr/local/airflow
WORKDIR /usr/local/airflow

# Copie o arquivo airflow.cfg para o contêiner
COPY ./config/airflow.cfg .

# Copie o entrypoint.sh para o contêiner
COPY ./script/entrypoint.sh .

# Crie um usuário de airflow
RUN useradd -ms /bin/bash -d /usr/local/airflow airflow

# Exponha a porta 8080
EXPOSE 8080

# Limpeza de cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /usr/share/man/* /usr/share/locale/* /var/cache/debconf/*

# Defina o usuário como airflow
USER airflow

# Defina o comando de inicialização do contêiner
CMD ["./entrypoint.sh"]
