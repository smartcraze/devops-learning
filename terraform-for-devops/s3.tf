resource "aws_s3_bucket" "testbucket" {
  bucket = "${var.my_environment}-test-my-app-bucket-d"

  tags = {
    Name = "${var.my_environment}-test-my-app-bucket-d"
  }
}

resource "aws_s3_bucket_versioning" "testbucket" {
  bucket = aws_s3_bucket.testbucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "testbucket" {
  bucket = aws_s3_bucket.testbucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "testbucket" {
  bucket = aws_s3_bucket.testbucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
