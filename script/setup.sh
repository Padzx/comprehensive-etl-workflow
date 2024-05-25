#!/bin/bash

# Setup script to configure the EC2 instance

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y python3-pip

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

sudo usermod -aG docker $USER

# Enable Docker service to start on boot
sudo systemctl enable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

git clone https://github.com/Padzx/comprehensive-etl-workflow /home/ubuntu/airflow-setup

# Navigate to the cloned repository directory
cd /home/ubuntu/airflow-setup

sudo docker-compose up -d

pip3 install boto3

echo "export AIRFLOW_HOME=~/airflow" >> ~/.bashrc
echo "export AIRFLOW__CORE__LOAD_EXAMPLES=False" >> ~/.bashrc
source ~/.bashrc

sudo docker-compose run airflow-init
sudo docker-compose up -d

# Optional: Add any other setup or configuration steps needed
