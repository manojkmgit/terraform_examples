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
  region = "${lookup(var.regions, var.dev_region)}"
  shared_credentials_file = var.aws_creds_1
  profile = "default"
}

provider "aws" {
  alias = "prod"
  region = "${lookup(var.regions, var.prod_region)}"
  shared_credentials_file = var.aws_creds_1
  profile = "prod_profile"
}

