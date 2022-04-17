resource "aws_route53_zone" "kjazic_pzone" {
  name = "kj11.local"

  vpc {
    vpc_id = module.vpc1.vpc_id
  }
}