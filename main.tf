provider "aws" {
  region = var.aws_region
}

# Call the VPC module for VPC1
module "vpc1" {
  source  = "./modules/vpc"
  vpc_cidr = var.vpc1_cidr
  vpc_name = "vpc1"
}

# Call the Subnet module for VPC1
module "subnet1" {
  source  = "./modules/subnet"
  vpc_id  = module.vpc1.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

# Call the EC2 module for VPC1
module "ec2_vpc1" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.subnet1.public_subnet_id
  security_group_id = module.vpc1.security_group_id
  static_ip         = var.static_ip
  key_name          = var.existing_key_pair_name
}

# Call the VPC module for VPC2
module "vpc2" {
  source  = "./modules/vpc"
  vpc_cidr = var.vpc2_cidr
  vpc_name = "vpc2"
}

# VPC Peering (Between VPC1 and VPC2)
resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id      = module.vpc1.vpc_id
  peer_vpc_id = module.vpc2.vpc_id
}

# Create the Autoscaling group behind a classic Load Balancer
module "autoscaling" {
  source             = "./modules/autoscaling"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  public_subnet_id   = module.subnet1.public_subnet_id
  security_group_id  = module.vpc1.security_group_id
  availability_zones = var.availability_zones
}
