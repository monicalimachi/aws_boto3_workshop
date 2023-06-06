module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type               = "t2.micro"
  monitoring                  = true
  vpc_security_group_ids      = [module.security_group.security_group_id]
  subnet_id                   = element(module.vpc.private_subnets, 0)
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name

  tags = {
    Terraform   = "true"
    Environment = "production"
  }


}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}