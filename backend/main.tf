resource "aws_s3_bucket" "backend" {
  bucket_prefix = "oleksii-kalinin-poc-"
}

resource "aws_s3_bucket_versioning" "backend" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = "Enabled"
  }
}
