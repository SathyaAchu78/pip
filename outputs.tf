output "vpc1_id" {
  description = "VPC 1 ID"
  value       = module.vpc1.vpc_id
}

output "vpc2_id" {
  description = "VPC 2 ID"
  value       = module.vpc2.vpc_id
}

output "ec2_vpc1_instance_public_ip" {
  description = "Public IP of the EC2 instance in VPC1"
  value       = module.ec2_vpc1.ec2_instance_public_ip
}

output "autoscaling_group_name" {
  description = "Autoscaling group name"
  value       = module.autoscaling.autoscaling_group_name
}
