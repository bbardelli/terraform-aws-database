resource "aws_dynamodb_table" "application-dynamodb-table" {
  name           = "application_table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "appName"
  range_key      = "comment"

  attribute {
    name = "appName"
    type = "S"
  }

  attribute {
    name = "comment"
    type = "S"
  }

}

resource "aws_dynamodb_table_item" "test" {
  table_name = aws_dynamodb_table.application-dynamodb-table.name
  hash_key   = aws_dynamodb_table.application-dynamodb-table.hash_key
  range_key = aws_dynamodb_table.application-dynamodb-table.range_key

  item = <<ITEM
{
  "appName": {"S": "application"},
  "comment": {"S": "Comment test"}  
}
ITEM
}