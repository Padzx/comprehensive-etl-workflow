
# [1.0.0] - 2024-05-20

## Added

* Construction of the Apache airflow docker image (Using the Official Apache Airflow Image). [Apache Airflow Image](https://github.com/Padzx/comprehensive-etl-workflow/blob/main/docker/docker-airflow/Dockerfile)

* entrypoint.sh file to run the defined settings. [Entrypoint File](https://github.com/Padzx/comprehensive-etl-workflow/blob/main/script/entrypoint.sh)

* Added a workflow for building images and uploading them to docker hub.
 [Workflow](https://github.com/Padzx/comprehensive-etl-workflow/actions)

 # [1.0.0] - 2024-05-24

 ## Added

 * Added CeleryExecutor with Redis. [Celery Executor](https://github.com/Padzx/comprehensive-etl-workflow/blob/main/docker-composeCeleryExecutor.yml)

 # [1.0.0] - 2024-05-25

 ## Added

* Added a new workflow Github Actions for automate the environment AWS ETL Workflow. [Workflow AWS](https://github.com/Padzx/comprehensive-etl-workflow/blob/main/.github/workflows/ci-cd.yml)

* Added a new Shell Script file (setup.sh) for the config environment resources. [Setup File](https://github.com/Padzx/comprehensive-etl-workflow/blob/main/script/setup.sh)

* Added new folder and a new file (main.tf) for incialize the environment AWS Apache Airflow. [Terraform Script](https://github.com/Padzx/comprehensive-etl-workflow/blob/main/ci/main.tf)

* Added requirements.txt file. [requirements](https://github.com/Padzx/comprehensive-etl-workflow/blob/main/requirements.txt) 