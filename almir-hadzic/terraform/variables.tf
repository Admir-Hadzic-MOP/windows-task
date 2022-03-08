variable "aws_access_key" {
    description = "Access Key for terraform iam user"
    sensitive = true
}

variable "aws_secret_key" {
    description = "AWS Secret terraform iam user"
    sensitive = true
}

variable "aws_region" {
    description = "AWS region to launch servers."
    default     = "eu-central-1"
}

variable "aws_region_availbility_zone" {
    description = "AWS region to launch servers."
    default     = "eu-central-1a"
}

variable "vpc_cidr_block" {
    description = "Cidr block to be used with vpc"
    default     = "10.0.0.0/23"
}

variable "public_subnet_cidr_block" {
    description = "Cidr block to be used with subnet"
    default     = "10.0.1.0/24"
}

variable "route53_zone_name" {
    description = "Name of Route53 Zone"
    default     = "private.moptest.com"
}

variable "s3_bucket_name" {
    description = "Name of s3 bucket"
    default     = "mop-test-bucket"
}

variable "ec2_instance_ami" {
    description = "Ami for ec2 instance"
    default     = "ami-09d416ef29471299a"
}

variable "ec2_instance_type" {
    description = "Type for ec2 instance"
    default     = "t2.micro"
}

variable "public_key" {
    description = "Public key for access to ec2 instances"
}

variable "dc1_private_ip" {
    description = "IP for dc server"
    default     = "10.0.1.10"
}

variable "dc1_hostname" {
    description = "Hostname for dc server"
    default     = "dc1"
}

variable "domain_name" {
    description = "Name of domain"
    default     = "addomain.moptest.com"
}

variable "domain_passwd" {
    description = "Password of domain admin"
    sensitive = true
}

variable "wsus1_private_ip" {
    description = "IP for wsus server"
    default     = "10.0.1.15"
}

variable "wsus1_hostname" {
    description = "Hostname for wsus server"
    default     = "wsus1"
}

variable "test1_private_ip" {
    description = "IP  for test server"
    default     = "10.0.1.20"
}

variable "test1_hostname" {
    description = "Hostname for test server"
    default     = "test1"
}

variable "peering_vpc_cidr_block" {
    description = "Cidr block to be used with peering vpc"
    default     = "10.0.5.0/24"
}
