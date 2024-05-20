#!/usr/bin/env bash

# Instalar dependências do Apache Airflow a partir do arquivo requirements.txt
pip install --no-cache-dir -r requirements.txt

# Define a função wait_for_port
wait_for_port() {
    local host="$1"
    local port="$2"
    local retry_seconds="${3:-5}"
    local max_attempts="${4:-100}"
    local attempt=1

    nc -z "$host" "$port"
    status=$?

    until [[ "$status" -eq 0 ]]; do
        if (( attempt == max_attempts )); then
            echo "Failed to connect to $host:$port after $attempt attempts."
            return 1
        fi

        echo "Attempt $attempt: $host:$port is not available yet"
        attempt=$(( attempt + 1 ))
        sleep "$retry_seconds"

        nc -z "$host" "$port"
        status=$?
    done

    echo "$host:$port is available"
    return 0
}

# Set default values for environment variables
: "${AIRFLOW_HOME:="/usr/local/airflow"}"
: "${AIRFLOW__CORE__EXECUTOR:="${EXECUTOR:-SequentialExecutor}"}"
: "${AIRFLOW__CORE__FERNET_KEY:="${FERNET_KEY:-$(python -c 'from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())')}"}"

export AIRFLOW_HOME
export AIRFLOW__CORE__EXECUTOR
export AIRFLOW__CORE__FERNET_KEY

case "$1" in
    webserver)
        if [ "$AIRFLOW__CORE__EXECUTOR" = "CeleryExecutor" ]; then
            wait_for_port "$REDIS_HOST" "$REDIS_PORT"
            wait_for_port "$FLOWER_HOST" "$FLOWER_PORT"
        fi
        wait_for_port "$POSTGRES_HOST" "$POSTGRES_PORT"
        airflow db upgrade
        exec airflow webserver
        ;;
    worker|scheduler|flower)
        wait_for_port "$POSTGRES_HOST" "$POSTGRES_PORT"
        exec airflow "$@"
        ;;
    version)
        exec airflow "$@"
        ;;
    *)
        exec "$@"
        ;;
esac
