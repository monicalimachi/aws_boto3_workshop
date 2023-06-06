module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = "workshop"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway         = true
  single_nat_gateway         = true
  one_nat_gateway_per_az     = false
  manage_default_network_acl = true

  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "workshop_botos3"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks              = ["0.0.0.0/0"]
  ingress_rules                    = ["http-80-tcp"]
  computed_ingress_rules           = ["ssh-tcp"]
  number_of_computed_ingress_rules = 1
  egress_rules                     = ["all-all"]

  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}