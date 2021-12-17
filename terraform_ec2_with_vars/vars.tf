#define variables
variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "region" {
  type = string
    default = "ap-south-1"
}

