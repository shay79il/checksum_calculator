import os
import hashlib
import boto3

s3 = boto3.client('s3')
bucket_name = os.environ['BUCKET_NAME']


def lambda_handler(event, context):
    for record in event['Records']:
        object_key = record['s3']['object']['key']
        print(f'Calculate checksum for file {object_key}')
        response = s3.get_object(Bucket=bucket_name, Key=object_key)
        content = response['Body'].read()
        md5_checksum: str = hashlib.md5(content).hexdigest()
        checksum_key = f"{object_key}.md5"
        s3.put_object(Bucket=bucket_name, Key=checksum_key, Body=md5_checksum)