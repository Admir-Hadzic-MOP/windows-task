resource "aws_s3_bucket" "b" {
  bucket = "kj-bucket"

  tags = {
    Name        = "KJ bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "bacl" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}