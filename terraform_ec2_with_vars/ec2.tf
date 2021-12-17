# Create a instance
resource "aws_instance" "node1" {
  ami = "ami-026f33d38b6410e30"
  instance_type = "t2.micro"
}

