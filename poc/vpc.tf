data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  az_names        = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets  = [for k, v in local.az_names : cidrsubnet(var.vpc_cidr, 8, k + 1)]
  private_subnets = [for k, v in local.az_names : cidrsubnet(var.vpc_cidr, 8, k + 21)]
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "poc-vpc"
  cidr = "10.0.0.0/16"

  azs             = local.az_names
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false
}
