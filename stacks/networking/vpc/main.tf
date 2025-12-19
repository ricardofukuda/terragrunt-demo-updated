module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = [for k, v in var.azs : cidrsubnet(var.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in var.azs : cidrsubnet(var.vpc_cidr, 4, k + length(var.azs))]

  private_subnet_tags = {
    Tier = "private"
  }

  public_subnet_tags = {
    Tier = "public"
  }

  enable_nat_gateway = true
  single_nat_gateway  = true # Force single natgateway
  one_nat_gateway_per_az = false # Force single natgateway

  enable_dns_hostnames = true
  enable_vpn_gateway = false

  tags = merge(var.tags, {Environment = var.env})
}