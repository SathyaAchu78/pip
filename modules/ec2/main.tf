# EC2 Instance
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids       = [var.security_group_id]
  key_name                    = var.key_name

  network_interface {
    network_interface_id = aws_network_interface.vnet0.id
    device_index         = 0
  }

  tags = {
    Name = "web-instance"
  }
}

# Elastic IP and Network Interface
resource "aws_network_interface" "vnet0" {
  subnet_id       = var.subnet_id
  private_ips     = [var.static_ip]
  security_groups = [var.security_group_id]
}

resource "aws_eip" "eip" {
  network_interface = aws_network_interface.vnet0.id
  vpc               = true
}
