# Declare the data source
data "aws_availability_zones" "available_prod_az" {
    provider = aws.prod
    state = "available"
}

resource "aws_vpc" "prod_vpc" {
  provider = aws.prod
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "prod_env"
  }
}

resource "aws_subnet" "prod_subnet" {
  provider = aws.prod
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = data.aws_availability_zones.available_prod_az.names[0]

  tags = {
    Name = "prod_env"
  }
}

resource "aws_network_interface" "prod_ni" {
  provider = aws.prod
  subnet_id   = aws_subnet.prod_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "prod_primary_network_interface"
  }
}

