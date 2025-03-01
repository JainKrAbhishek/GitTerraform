import json
import boto3

def lambda_handler(event,context):
    client = boto3.run_instances(
        ImageId = "ami-0d682f26195e9ec0f"
        InstanceType= 't2.micro'
        KeyName = 'NewKey'
        MaxCount=1
        MinCount=1
    )