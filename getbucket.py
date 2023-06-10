import boto3
import botocore
from boto3 import client

s3 = boto3.resource('s3' , region_name='us-east-1')
bucket_name = 's3-bucket-workshop-1001-pyday'
des_filename= 'imagenes/lp1.jpeg'  ##KEY


try:
    s3.Bucket(bucket_name).download_file(des_filename, 'images/downloaded/moni.jpeg')
except botocore.exceptions.ClientError as e:
    if e.response['Error']['Code'] == "404":
        print("The object does not exist.")
    else:
        raise Exception

