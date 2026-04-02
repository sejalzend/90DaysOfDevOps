# Terraform block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Region
provider "aws" {

  region = "us-west-2"
}

# Creating S3 bucket
resource "aws_s3_bucket" "my_bucket" {

  bucket = "terraweek-sejal-2026"
}

# Instance creation EC2

resource "aws_instance" "my_instance" {

  ami = "ami-0d76b909de1a0595d" # AMI ID

  instance_type = "t3.micro" # t2.micro isn't available going with t3.micro which is free tier

  tags = {
    Name = "TerraWeek-Modified"
  }
}