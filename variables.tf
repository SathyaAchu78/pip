variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-southeast-2"
}

variable "vpc1_cidr" {
  description = "CIDR block for VPC1"
  default     = "10.0.0.0/16"
}

variable "vpc2_cidr" {
  description = "CIDR block for VPC2"
  default     = "10.1.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  default     = "10.0.2.0/24"
}

variable "static_ip" {
  description = "Static IP for network interface"
  default     = "10.0.2.5"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2b"]
}

variable "existing_key_pair_name" {
  description = "The name of the existing key pair to attach to the VM"
  default     = "my-existing-keypair"
}

variable "s3_bucket" {
  description = "S3 bucket for Terraform state"
  default     = "my-terraform-state-bucket-pip"
}

variable "dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  default     = "terraform-lock-table"
}

variable "state_key" {
  description = "The key/path inside the S3 bucket for storing the Terraform state"
  default     = "terraform.tfstate"
}

