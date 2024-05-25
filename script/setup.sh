#!/bin/bash

# Setup script to configure the EC2 instance

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y python3-pip

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Add the user to the docker group
sudo usermod -aG docker $USER

# Enable Docker service to start on boot
sudo systemctl enable docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone the repository
git clone https://github.com/Padzx/comprehensive-etl-workflow /home/ubuntu/airflow-setup

# Navigate to the cloned repository directory
cd /home/ubuntu/airflow-setup

# Run Docker Compose to start Airflow
sudo docker-compose up -d

# Install boto3 for AWS interactions
pip3 install boto3

# Set Airflow environment variables
echo "export AIRFLOW_HOME=~/airflow" >> ~/.bashrc
echo "export AIRFLOW__CORE__LOAD_EXAMPLES=False" >> ~/.bashrc
source ~/.bashrc

# Initialize Airflow
sudo docker-compose run airflow-init
sudo docker-compose up -d

# Optional: Add any other setup or configuration steps needed
