# Use the official Python image.
FROM python:3.9-slim

# Set environment variables
ENV AIRFLOW_HOME=/usr/local/airflow
ENV AIRFLOW_VERSION=2.1.4
ENV PYTHON_DEPS=""
ENV AIRFLOW_DEPS=""

# Install system dependencies
RUN set -ex \
    && buildDeps=' \
        freetds-dev \
        libkrb5-dev \
        libsasl2-dev \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        git \
        gcc \
        libc-dev \
    ' \
    && apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
        $buildDeps \
        freetds-bin \
        build-essential \
        default-libmysqlclient-dev \
        apt-utils \
        curl \
        rsync \
        netcat \
        locales \
    && sed -i 's/^# en_US.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow \
    && pip install -U pip setuptools wheel \
    && pip install pytz \
    && pip install pyOpenSSL \
    && pip install ndg-httpsclient \
    && pip install pyasn1 \
    && pip install apache-airflow[crypto,celery,postgres,hive,jdbc,mysql,ssh${AIRFLOW_DEPS:+,}${AIRFLOW_DEPS}]==${AIRFLOW_VERSION} \
    && if [ -n "${PYTHON_DEPS}" ]; then pip install ${PYTHON_DEPS}; fi \
    && apt-get purge --auto-remove -yqq $buildDeps \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

# Install specific versions to avoid import errors
RUN pip install 'jinja2<3.1.0' 'markupsafe<2.1.0' 'SQLAlchemy<2.0'

# Copy the entrypoint script
COPY ./script/entrypoint.sh ${AIRFLOW_HOME}/entrypoint.sh
RUN chmod +x ${AIRFLOW_HOME}/entrypoint.sh

# Set the working directory
WORKDIR ${AIRFLOW_HOME}

# Set the user to airflow
USER airflow

# Set the entrypoint
ENTRYPOINT ["./entrypoint.sh"]
CMD ["webserver"]
