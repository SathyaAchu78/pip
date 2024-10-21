variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "Instance type for EC2"
}

variable "public_subnet_id" {
  description = "Public Subnet ID for AutoScaling group"
}

variable "security_group_id" {
  description = "Security group ID for instances"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key pair name"
}
