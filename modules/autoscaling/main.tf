# Launch Configuration for AutoScaling
resource "aws_launch_configuration" "web_launch_config" {
  name          = "web-launch-config"
  image_id      = var.ami_id
  instance_type = var.instance_type
  security_groups = [var.security_group_id]
  key_name = var.key_name

  lifecycle {
    create_before_destroy = true
  }
}

# AutoScaling Group
resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_launch_config.id
  min_size             = 3
  max_size             = 6
  desired_capacity     = 3
  vpc_zone_identifier  = [var.public_subnet_id]
  availability_zones   = var.availability_zones

  tag {
    key                 = "Name"
    value               = "autoscaling-instance"
    propagate_at_launch = true
  }
}

# Classic Load Balancer
resource "aws_elb" "web_elb" {
  name               = "web-elb"
  availability_zones = var.availability_zones
  security_groups    = [var.security_group_id]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_autoscaling_group.web_asg.instances
}
