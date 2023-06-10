import boto3
from botocore.config import Config

my_config = Config(
    region_name = 'us-east-1',
    signature_version = 'v4',
    retries = {
        'max_attempts': 1,
        'mode': 'standard'
    }
)

session = boto3.Session(profile_name='user1001')
user1001_s3_client=session.client('s3', region_name='us-east-1')
