# Day lambda config
# lamda script rendered for region, asg, name, min, max, des values
data "template_file" "day_script" {
  template = "${file("${path.module}/lambda_code/lambda_function.py")}"

  vars = {
    asg_name = aws_autoscaling_group.ops-asg.name
    min = 2
    des = 2
    max = 2
  }
}

# Creating zip from rendered lambda script
data "archive_file" "day_lambda_zip" {
  type        = "zip"
  source {
    content  = "${data.template_file.day_script.rendered}"
    filename = "lambda_function.py"
  }
  output_path = "${path.module}/day_lambda.zip"
}

# Creating lambda from the zip file
resource "aws_lambda_function" "ops_lambda_day" {
  depends_on = [
    data.archive_file.day_lambda_zip
  ]
  filename      = "${path.module}/day_lambda.zip"
  function_name = "ops-lambda-day"
  role          = var.lambda_role_arn
  handler       = "lambda_function.lambda_handler"

  runtime = "python3.8"
}


# Night lambda config

# lamda script rendered for region, asg, name, min, max, des values
data "template_file" "night_script" {
  template = "${file("${path.module}/lambda_code/lambda_function.py")}"

  vars = {
    asg_name = aws_autoscaling_group.ops-asg.name
    min = 1
    des = 1
    max = 1
  }
}

# Creating zip from rendered lambda script
data "archive_file" "night_lambda_zip" {
  type        = "zip"
  source {
    content  = "${data.template_file.night_script.rendered}"
    filename = "lambda_function.py"
  }
  output_path = "${path.module}/night_lambda.zip"
}

# Creating lambda from the zip file
resource "aws_lambda_function" "ops_lambda_night" {
  depends_on = [
    data.archive_file.night_lambda_zip
  ]
  filename      = "${path.module}/night_lambda.zip"
  function_name = "ops-lambda-night"
  role          = var.lambda_role_arn
  handler       = "lambda_function.lambda_handler"

  runtime = "python3.8"
}
