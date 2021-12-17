# Declare the data source
data "aws_availability_zones" "available_dev_az" {
  state = "available"
}


resource "aws_vpc" "dev_vpc" {
  cidr_block = "172.15.0.0/16"

  tags = {
    Name = "dev_env"
  }
}

resource "aws_subnet" "dev_subnet" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = "172.15.10.0/24"
  availability_zone = data.aws_availability_zones.available_dev_az.names[0]

  tags = {
    Name = "dev_env"
  }
}

resource "aws_network_interface" "dev_ni" {
  subnet_id   = aws_subnet.dev_subnet.id
  private_ips = ["172.15.10.100"]

  tags = {
    Name = "dev_primary_network_interface"
  }
}

