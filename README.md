# Comprehensive ETL Workflow


> **Note:**
> This repository simulates in a simple way an ETL environment with AWS integration, without the need for a repository to be used in a professional environment.

## Summary

- [Introduction](#introduction)
- [Apache Airflow with Docker and Docker-Compose](#apachei-airflow-with-docker-and-docker-compose)



## Introduction

This project has the main objective of showing how an ETL (Extract, Transform and Load) process works in a production environment. Nowadays, data has become a totally precious and important material for any company, since data bring results or insights for decision making, therefore the ETL process is extremely important so that we can always have data available so that we can generate even more value, this example we use **Apache Airflow**, **Postgres**, **Redis** and **AWS**.

>**Note:**
> If you want to know what ETL is and how it works: [ETL.](https://www.oracle.com/pt/integration/what-is-etl/)

## Apache Airflow with Docker and Docker-Compose

### Introduction

Apache Airflow is a powerful platform used to programmatically create, schedule, and monitor workflows. It allows you to define your workflows as directed acyclic graphs (DAGs) of tasks. Airflow's flexibility and scalability make it the ideal choice for managing complex workflows.

>**Note:**
> If want know more about Apache Airflow: [Apache Airflow.](https://airflow.apache.org/docs/apache-airflow/stable/index.html)


### Why Docker-Compose?

We have chosen to deploy Apache Airflow using Docker and Docker Compose due to the numerous benefits these tools offer:

### Docker 

Docker is a platform that allows you to package applications and their dependencies into a standardized unit called a container. Here are some key benefits:

- **Consistency**: Ensures that your application runs the same way, regardless of where it is deployed

- **Isolation**: Each container runs in its own isolated environment, which helps in avoiding conflicts between different applications.

- **Scalability**: Easily scale your application up or down by adding or removing containers.

### Docker-Compose 

Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to configure your application’s services in a YAML file, making it easy to manage and scale. Benefits include:

**Simplified Configuration**: Define all your services, networks, and volumes in a single file.

**Ease of Use**: Start up your entire application stack with a single command (docker-compose up).

**Portability**: Easily share your application setup with others, ensuring they can run it in the same way you do.

#### Benefits And Avantagens

**Reproducibility**: Using Docker ensures that the environment in which Airflow runs is consistent across different machines and setups, reducing the "it works on my machine" problem.

**Ease of Deployment**: Docker and Docker Compose streamline the setup and deployment process, making it easier to get Airflow up and running quickly.

**Scalability**: Docker Compose allows you to scale Airflow by simply adjusting the configuration file, enabling quick scaling to meet your workflow demands.

**Isolation**: Running Airflow in Docker containers ensures that it is isolated from other applications, preventing dependency conflicts and enhancing security.

**Resource Efficiency**: Containers are lightweight and use system resources more efficiently compared to traditional virtual machines.

By leveraging Docker and Docker Compose, we aim to provide a robust and scalable environment for Apache Airflow, simplifying the setup process and ensuring consistent and reliable operations.

>**Note:**
> If you want more about Docker and Docker-Compose: [Docker](https://hub.docker.com/) and [Docker-Compose.](https://docs.docker.com/compose/)









