resource "aws_instance" "dc1" {
  ami                         = var.ec2_instance_ami
  instance_type               = var.ec2_instance_type
  private_ip                  = var.dc1_private_ip
  subnet_id                   = module.vpc.public_subnets[0]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.main.id]

  tags = {
    Name = var.dc1_hostname
  }
}

resource "aws_route53_record" "dc1" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "dc1"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.dc1.private_ip}"]
}

resource "aws_instance" "wsus1" {
  ami                         = var.ec2_instance_ami
  instance_type               = var.ec2_instance_type
  private_ip                  = var.wsus1_private_ip
  subnet_id                   = module.vpc.public_subnets[0]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.main.id]

  user_data  = templatefile("./bootstrap_scripts/bootstrap.txt",{
    new_name          = "${var.wsus1_hostname}"
    domain_name       = "${var.domain_name}"
    domain_passwd     = "${var.domain_passwd}"
    dc1_private_ip    = "${var.dc1_private_ip}"
    s3_bucket_name    = "${var.s3_bucket_name}"
    aws_access_key    = "${var.aws_access_key}"
    aws_secret_key    = "${var.aws_secret_key}"
  })

  tags = {
    Name = var.wsus1_hostname
  }
}

resource "aws_route53_record" "wsus1" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "wsus1"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.wsus1.private_ip}"]
}

resource "aws_instance" "test1" {
  ami                         = var.ec2_instance_ami
  instance_type               = var.ec2_instance_type
  private_ip                  = var.test1_private_ip
  subnet_id                   = module.vpc.public_subnets[0]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.main.id]


  user_data  = templatefile("./bootstrap_scripts/bootstrap.txt",{
    new_name          = "${var.test1_hostname}"
    domain_name       = "${var.domain_name}"
    domain_passwd     = "${var.domain_passwd}"
    dc1_private_ip    = "${var.dc1_private_ip}"
    s3_bucket_name    = "${var.s3_bucket_name}"
    aws_access_key    = "${var.aws_access_key}"
    aws_secret_key    = "${var.aws_secret_key}"
  })

  tags = {
    Name = var.test1_hostname
  }
}

resource "aws_route53_record" "test1" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "test1"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.test1.private_ip}"]
}