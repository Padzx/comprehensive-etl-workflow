# Comprehensive ETL Workflow


> **Note:**
> This repository simulates in a simple way an ETL environment with AWS integration, without the need for a repository to be used in a professional environment.

## Summary

- [Introduction](#introduction)
- [Apache Airflow with Docker and Docker-Compose](#apachei-airflow-with-docker-and-docker-compose)



## Introduction

This project has the main objective of showing how an ETL (Extract, Transform and Load) process works in a production environment. Nowadays, data has become a totally precious and important material for any company, since data bring results or insights for decision making, therefore the ETL process is extremely important so that we can always have data available so that we can generate even more value, this example we use **Apache Airflow**, **Postgres**, **Redis** and **AWS**.

>**Note:**
> If you want to know what ETL is and how it works: [ETL](https://www.oracle.com/pt/integration/what-is-etl/)

## Apachei Airflow with Docker and Docker-Compose

### Introduction

Apache Airflow is a powerful platform used to programmatically create, schedule, and monitor workflows. It allows you to define your workflows as directed acyclic graphs (DAGs) of tasks. Airflow's flexibility and scalability make it the ideal choice for managing complex workflows.

>**Note:**
> If want know more about Apache Airflow: [Apache Airflow](https://airflow.apache.org/docs/apache-airflow/stable/index.html)


### Why Docker-Compose?

We have chosen to deploy Apache Airflow using Docker and Docker Compose due to the numerous benefits these tools offer:

### Docker 

Docker is a platform that allows you to package applications and their dependencies into a standardized unit called a container. Here are some key benefits:

- **Consistency**: Ensures that your application runs the same way, regardless of where it is deployed

- **Isolation**: Each container runs in its own isolated environment, which helps in avoiding conflicts between different applications.











