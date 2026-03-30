resource "aws_dynamodb_table" "my_app_table" {
  name         = "${var.my_environment}-test-my-app-table-d"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "${var.my_environment}-test-my-app-table-d"
    Environment = var.my_environment
  }
}
