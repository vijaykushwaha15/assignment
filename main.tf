terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" 
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


module "us-east-1" {
  source = "./nginx-asg-ec2"
  public_key = var.public_key
  lambda_role_arn = aws_iam_role.iam_role_lambda.arn
  providers = {
    aws = "aws.us-east-1"
  }
}

module "ap-south-1" {
  source = "./nginx-asg-ec2"
  instance_type = var.instance_type
  public_key = var.public_key
  lambda_role_arn = aws_iam_role.iam_role_lambda.arn
}
