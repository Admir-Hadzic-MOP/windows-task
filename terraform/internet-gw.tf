# Internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "main"
  }
}


# Route 53 Zone

resource "aws_route53_zone" "private" {
  name = "jasmin.local"

  vpc {
    vpc_id = aws_vpc.prod-vpc.id
  }
}



# Subnet with route table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.prod-route-table.id
}

resource "aws_network_interface" "win-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.11.12.10"]
  security_groups = [aws_security_group.allow_rdp.id]

}

resource "aws_network_interface" "win-wsus-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.11.12.11"]
  security_groups = [aws_security_group.allow_rdp.id]

}

resource "aws_network_interface" "win-testsrv-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.11.12.20"]
  security_groups = [aws_security_group.allow_rdp.id]

}
