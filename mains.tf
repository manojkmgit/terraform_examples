

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create a instance
resource "aws_instance" "node1" {
  ami = "ami-026f33d38b6410e30"
  instance_type = "t2.micro"
}
