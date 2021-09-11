# Creating launch config for autoscaling group
resource "aws_launch_configuration" "asg_conf" {
  name          = "ops-nginx-config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.dev_deployer.key_name
  security_groups = [aws_security_group.sg_group.id]
  user_data = file("${path.module}/scripts/nginx.sh")
  root_block_device {
    volume_size = 10
  }
}
