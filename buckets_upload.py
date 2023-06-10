import boto3
from boto3 import client

s3 = boto3.client('s3')
filename = 'images/lp1.jpeg'                
bucket_name = 's3-bucket-workshop-1001-pyday'
des_filename= 'imagenes/lp1.jpeg'

s3.upload_file(filename, bucket_name, des_filename)
