variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "security_group_id" {
  description = "Security Group ID"
}

variable "static_ip" {
  description = "Static private IP for EC2 instance"
}

variable "key_name" {
  description = "SSH key pair name"
}
