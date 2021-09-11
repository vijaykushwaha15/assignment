# Day lambda execution config
# Cloudwatch event to run at 7:30 AM
resource "aws_cloudwatch_event_rule" "day_event" {
    name = "day-event"
    schedule_expression = "cron(0 2 ? * * *)"
}

# Cloudwatch day event added to day lambda
resource "aws_cloudwatch_event_target" "day_lambda" {
    rule = "${aws_cloudwatch_event_rule.day_event.name}"
    target_id = "day_lambda"
    arn = "${aws_lambda_function.ops_lambda_day.arn}"
}

# Cloudwatch allowed to execute day lambda
resource "aws_lambda_permission" "allow_cloudwatch_for_day_lambda_execution" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.ops_lambda_day.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.day_event.arn}"
}

# Night lambda execution config
# Cloudwatch event to run at 7:30 AM
resource "aws_cloudwatch_event_rule" "night_event" {
    name = "night-event"
    schedule_expression = "cron(0 17 ? * * *)"
}

# Cloudwatch day event added to day lambda
resource "aws_cloudwatch_event_target" "night_lambda" {
    rule = "${aws_cloudwatch_event_rule.night_event.name}"
    target_id = "night_lambda"
    arn = "${aws_lambda_function.ops_lambda_night.arn}"
}

# Cloudwatch allowed to execute day lambda
resource "aws_lambda_permission" "allow_cloudwatch_for_night_lambda_execution" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.ops_lambda_night.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.night_event.arn}"
}
