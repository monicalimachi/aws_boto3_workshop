#### ec2

output "arn" {
  description = "The ARN of the instance"
  value       = module.ec2_instance.arn
}


output "instance_state" {
  description = "The state of the instance"
  value       = module.ec2_instance.instance_state
}


output "password_data" {
  description = "Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows. This attribute is only exported if `get_password_data` is true"
  value       = module.ec2_instance.password_data
}


output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_instance.private_dns
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_instance.public_ip
}

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value       = module.ec2_instance.private_ip
}


output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.ec2_instance.tags_all
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request"
  value       = module.ec2_instance.spot_bid_status
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request"
  value       = module.ec2_instance.spot_request_state
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request"
  value       = module.ec2_instance.spot_instance_id
}

output "ami" {
  description = "AMI ID that was used to create the instance"
  value       = module.ec2_instance.ami
}

################################################################################
# IAM Role / Instance Profile
################################################################################

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = module.ec2_instance.iam_role_name
}

output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
  value       = module.ec2_instance.iam_role_arn
}


################################################################################
# Block Devices
################################################################################


output "ebs_block_device" {
  description = "EBS block device information"
  value       = module.ec2_instance.ebs_block_device
}


output "security_group_arn" {
  description = "The ARN of the security group"
  value       = module.security_group.security_group_arn
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.security_group.security_group_id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = module.security_group.security_group_name
}

################################################################################
# VPC
################################################################################

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.vpc.default_security_group_id
}

###### key
#output "public_key" {
#  description = "public"
#  value = aws_key_pair.this.public_key
#}
#
#output "private_key" {
#  description = "public"
#  value = aws_key_pair.this.key_name
#}