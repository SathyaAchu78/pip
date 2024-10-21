output "autoscaling_group_name" {
  description = "Name of the AutoScaling group"
  value       = aws_autoscaling_group.web_asg.name
}
