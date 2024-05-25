provider "aws" {
  region = var.region
}

# Create a VPC for Airflow
resource "aws_vpc" "airflow_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.airflow_vpc.id
}

# Create a Route Table
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.airflow_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Create a subnet inside the Airflow VPC
resource "aws_subnet" "airflow_subnet" {
  vpc_id                  = aws_vpc.airflow_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.airflow_subnet.id
  route_table_id = aws_route_table.routetable.id
}

# Create a security group for the Airflow EC2 instance
resource "aws_security_group" "airflow_security_group" {
  vpc_id = aws_vpc.airflow_vpc.id

  # Allow SSH, HTTP, and HTTPS traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a Key Pair
resource "aws_key_pair" "airflow_key" {
  key_name   = "airflow-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create an EC2 instance for Apache Airflow
resource "aws_instance" "airflow_instance" {
  ami             = "ami-0c55b159cbfafe1f0"
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.airflow_subnet.id
  key_name        = aws_key_pair.airflow_key.key_name
  security_groups = [aws_security_group.airflow_security_group.name]
}

# Create an S3 bucket for Airflow logs and data
resource "aws_s3_bucket" "airflow_bucket" {
  bucket = "airflow-logs-${random_pet.bucket_suffix.id}"
}

resource "random_pet" "bucket_suffix" {
  length = 2
}

# Outputs
output "ec2_instance_id" {
  value = aws_instance.airflow_instance.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.airflow_instance.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.airflow_bucket.bucket
}
