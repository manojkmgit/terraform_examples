# Create a instance
resource "aws_instance" "dev_docker_node" {
  ami = "${lookup(var.aws-ami-ids, var.dev_region)}"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.dev_ni.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "standard"
  }

}

output "dev_docker_node_ip" {
  value = aws_instance.dev_docker_node.public_ip
}
