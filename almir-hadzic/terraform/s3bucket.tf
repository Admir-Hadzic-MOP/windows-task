resource "aws_s3_bucket" "scripts_bucket" {
  bucket = var.s3_bucket_name
}