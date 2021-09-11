#Create LB for ops-asg
resource "aws_lb" "ops_lb" {
  name               = "ops-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg_group.id]
  subnets            = [for s in data.aws_subnet.default_subnet : s.id]
}

# Creating Target group for LB
resource "aws_lb_target_group" "ops-tg" {
  name        = "ops-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id   = data.aws_vpc.default_vpc.id
}

# Attaching Target group to LB
resource "aws_lb_listener" "tg_lb_attachment" {
  load_balancer_arn = aws_lb.ops_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ops-tg.arn
  }
}
