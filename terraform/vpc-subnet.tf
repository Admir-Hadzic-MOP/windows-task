# Create VPC pool and Subnet /24

resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.11.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_vpc_dhcp_options" "dns_resolver" {
  domain_name_servers = ["10.11.12.10", "10.11.0.2"]
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = aws_vpc.prod-vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.dns_resolver.id
}

# Create Subnet

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.11.12.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "prod-subnet"
  }
}