resource "aws_security_group" "main" {
  name        = "Security Group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "Allow VPC traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [module.vpc.vpc_cidr_block]
  }

  ingress {
    description       = "Allow RDP"
    from_port         = 3389
    to_port           = 3389
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}