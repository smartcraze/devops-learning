resource "aws_s3_bucket" "my_app_bucket" {
  bucket = "${var.my_env}-tws-demo-app-bucket"

  tags = {
    Name = "${var.my_env}-tws-demo-app-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "my_app_bucket" {
  bucket = aws_s3_bucket.my_app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
