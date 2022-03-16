#Create S3 Bucket

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket-jasmin"
  acl    = "private"

  versioning = {
    enabled = true
  }

}