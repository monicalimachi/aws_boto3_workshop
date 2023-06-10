import boto3
from boto3 import client


ec2 = boto3.client('ec2', region_name='us-east-1')

# Retrieves all regions/endpoints that work with EC2
response = ec2.describe_regions()
print('Regions:', response['Regions'])

# Retrieves availability zones only for region of the ec2 object
response = ec2.describe_availability_zones()
print('Availability Zones:', response['AvailabilityZones'])


## Instances in state running
AWS_REGION = "us-east-1"
EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
INSTANCE_STATE = 'running'
instances = EC2_RESOURCE.instances.filter(
    Filters=[
        {
            'Name': 'instance-state-name',
            'Values': [
                INSTANCE_STATE
            ]
        }
    ]
)
print(f'Instances in state "{INSTANCE_STATE}":')
for instance in instances:
    print(f'  - Instance ID: {instance.id}')
