resource "aws_route53_zone" "kjazic_pzone" {
  name = "kj.local"

  vpc {
    vpc_id = module.vpc.vpc_id
  }
}