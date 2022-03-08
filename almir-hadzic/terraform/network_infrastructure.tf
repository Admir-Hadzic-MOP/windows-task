module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "infrastructure_vpc"
  cidr   = var.vpc_cidr_block

  azs               = [var.aws_region_availbility_zone]
  public_subnets    = [var.public_subnet_cidr_block]

  enable_dhcp_options      = true
  dhcp_options_domain_name = var.route53_zone_name

  enable_nat_gateway     = true
  enable_dns_hostnames   = true
  enable_dns_support     = true
}

resource "aws_route53_zone" "private_zone" {
  name = var.route53_zone_name

  vpc {
    vpc_id = module.vpc.vpc_id
  }
}

module "peering_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "peering_vpc"
  cidr   = var.peering_vpc_cidr_block
}

resource "aws_vpc_peering_connection" "main" {
  peer_vpc_id   = module.peering_vpc.vpc_id
  vpc_id        = module.vpc.vpc_id
  auto_accept   = true

  tags = {
    Name = "main_peering"
  }
}

resource "aws_route" "primary2secondary" {
  route_table_id            = module.vpc.vpc_main_route_table_id
  destination_cidr_block    = module.peering_vpc.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}

resource "aws_route" "secondary2primary" {
  route_table_id            = module.peering_vpc.vpc_main_route_table_id
  destination_cidr_block    = module.vpc.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}