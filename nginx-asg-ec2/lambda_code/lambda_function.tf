import boto3
asg = boto3.client('autoscaling')

def lambda_handler(event, context):
    asg.update_auto_scaling_group(AutoScalingGroupName="${asg_name}",MinSize=${min},MaxSize=${max},DesiredCapacity=${des})
