resource "aws_s3_bucket" "dev_bucket" {
  bucket = "dev-bucket-mya1ppx"
  acl = "public-read"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket" "prod_bucket" {
  provider = aws.prod
  bucket = "prod-bucket-mya1ppx"
  acl = "public-read"
  lifecycle {
    prevent_destroy = false
  }
}

