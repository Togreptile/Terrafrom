provider "aws" {
  region = "ap-northeast-2"  # Replace with your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "fan-of-your"  # Replace with a globally unique bucket name

  acl    = "private"  # Access control for the bucket. Options: private, public-read, public-read-write, authenticated-read, log-delivery-write, aws-exec-read, bucket-owner-read, bucket-owner-full-control
}

resource "aws_s3_bucket_object" "sample_object" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "sample.txt"  # Specify the desired file name

  # source = "d:\Terraform\sample.txt"  # Replace with the local path to your file

  acl    = "private"  # Access control for the object. Options: private, public-read, public-read-write, authenticated-read, aws-exec-read, bucket-owner-read, bucket-owner-full-control
}

## Creating  a ec2-instance using variables .tf 

locals {
  type        = "production"
  number              = 2
  name     = "web-server"
}

resource "aws_instance" "example_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  count = local.number
  tags =  {
    Name = "${local.type} - ${local.name}-Sucess "
  }
}
