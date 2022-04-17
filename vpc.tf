module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "infrastructure"
  cidr = "10.10.0.0/16"

  azs             = var.azs
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
    enable_dhcp_options      = true
  dhcp_options_domain_name = "kj.local"

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false

  enable_dns_hostnames = true
  enable_dns_support   = true
}