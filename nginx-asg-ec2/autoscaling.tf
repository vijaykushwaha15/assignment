# Creating ASG for ec2
resource "aws_autoscaling_group" "ops-asg" {
  name                      = "ops-asg"
  max_size                  = 2
  min_size                  = 2
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.asg_conf.name
  vpc_zone_identifier       = [for s in data.aws_subnet.default_subnet : s.id]

  tag {
    key                 = "Name"
    value               = "ops-asg-ec2"
    propagate_at_launch = true
  }
}

# Attaching target group to ASG
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.ops-asg.id
  alb_target_group_arn   = aws_lb_target_group.ops-tg.arn
}

