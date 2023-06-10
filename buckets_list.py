import boto3
from boto3 import client

s3 = boto3.client('s3')
response = s3.list_buckets()
for bucket in response['Buckets']:
    print('BucketName: {}'.format(bucket['Name']))