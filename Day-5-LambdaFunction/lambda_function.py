import json
import boto3

def lambda_handler(event, context):
    # Create an EC2 client
    ec2_client = boto3.client('ec2')

    try:
        # Launch an EC2 instance
        response = ec2_client.run_instances(
            ImageId="ami-0d682f26195e9ec0f",
            InstanceType='t2.micro',
            KeyName='NewKey',
            MaxCount=1,
            MinCount=1
        )
        
        # Return the response
        return {
            'statusCode': 200,
            'body': json.dumps(response)
        }
    
    except Exception as e:
        # Handle exceptions and return an error message
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }