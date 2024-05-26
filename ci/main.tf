
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "airflow_bucket" {
  bucket = "airflow-etl-data"
  acl    = "private"

  tags = {
    Name        = "Airflow ETL Data Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "airflow_bucket_versioning" {
  bucket = aws_s3_bucket.airflow_bucket.id
  enabled = true
}

resource "aws_s3_bucket_default_server_side_encryption_configuration" "airflow_bucket_encryption" {
  bucket = aws_s3_bucket.airflow_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
