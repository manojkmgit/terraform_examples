# Create a instance
resource "aws_instance" "prod_docker_node" {
  provider = aws.prod
  ami = "${lookup(var.aws-ami-ids, var.prod_region)}"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.prod_ni.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "standard"
  }

}

output "prod_docker_node_ip" {
  value = aws_instance.prod_docker_node.public_ip
}
