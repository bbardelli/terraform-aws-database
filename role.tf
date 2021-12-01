resource "aws_iam_policy" "db_access_policy" {  
  path        = "/"
  description = "Access data policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
    {
            "Sid": "DynamoDBTableAccess",
            "Effect": "Allow",
            "Action": [
                "dynamodb:BatchGetItem",
                "dynamodb:BatchWriteItem",
                "dynamodb:ConditionCheckItem",
                "dynamodb:PutItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:UpdateItem"
            ],
            "Resource": "${aws_dynamodb_table.application-dynamodb-table.arn}"
        }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm-attach" {
  role       = var.role
  policy_arn = aws_iam_policy.db_access_policy.arn
}

