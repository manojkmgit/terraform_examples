#define variables
variable "aws_creds_1" {
  type = string
}

variable "dev_region" {
  type = string
  default = "eu-west-1"
}

variable "prod_region" {
  type = string
  default = "ap-south-1"
}

variable "regions" {
  type = map
  default = {
    eu-west-2 = "eu-west-2"
    eu-west-1 = "eu-west-1"
    ap-south-1 = "ap-south-1"
  }
}

variable "aws-ami-ids" {
  type = map
  default = {
    eu-west-2 = "ami-01a6e31ac994bbc09"
    eu-west-1 = "ami-0b850cf02cc00fdc8"
    ap-south-1 = "ami-026f33d38b6410e30"
  }
}
