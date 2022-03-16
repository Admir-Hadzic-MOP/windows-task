# Security group

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description      = "RDP from VPC"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  ingress {
    description      = "Local in VPC tcp"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["10.11.12.0/24"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

ingress {
    description      = "Local in VPC udp"
    from_port        = 0
    to_port          = 65535
    protocol         = "udp"
    cidr_blocks      = ["10.11.12.0/24"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_rdp"
  }
}