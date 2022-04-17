module "vpc1" {
  source = "terraform-aws-modules/vpc/aws"

  name = "infrastructure"
  cidr = "10.11.0.0/16"

  azs             = var.azs
  private_subnets = ["10.11.1.0/24", "10.11.2.0/24", "10.11.3.0/24"]
  public_subnets  = ["10.11.101.0/24", "10.11.102.0/24", "10.11.103.0/24"]
    enable_dhcp_options      = true
  dhcp_options_domain_name = "kj11.local"

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false

  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "vpc2" {
  source = "terraform-aws-modules/vpc/aws"

  name = "infrastructure"
  cidr = "10.12.0.0/16"

  azs             = var.azs2
  private_subnets = ["10.12.1.0/24", "10.12.2.0/24", "10.12.3.0/24"]
  public_subnets  = ["10.12.101.0/24", "10.12.102.0/24", "10.12.103.0/24"]
    enable_dhcp_options      = true
  dhcp_options_domain_name = "kj12.local"

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false

  enable_dns_hostnames = true
  enable_dns_support   = true
}