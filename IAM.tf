# IAM Role for lambda's
resource "aws_iam_role" "iam_role_lambda" {
  name = "iam_role_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# IAM Policy to allow lambda autoscaling permissions
resource "aws_iam_policy" "lambda_autoscaling" {
  name        = "lambda_autoscaling_policy"
  path        = "/"
  description = "IAM policy for update autoscaling from a lambda"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "autoscaling:UpdateAutoScalingGroup",
            "Resource": "*"
        }
    ]
}
EOF
}

# Attaching IAM policy to lambda role
resource "aws_iam_role_policy_attachment" "lambda_asg" {
  role       = aws_iam_role.iam_role_lambda.name
  policy_arn = aws_iam_policy.lambda_autoscaling.arn
}
