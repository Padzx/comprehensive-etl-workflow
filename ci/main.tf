# variables.tf

variable "region" {
  description = "The AWS region to deploy into"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}
