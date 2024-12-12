data "archive_file" "function_zip" {
    type        = "zip"
    source_dir  = "${path.module}/python/"
    output_path = "${path.module}/handler.zip"
}

resource "aws_lambda_function" "sub_minute_iterator" {
  function_name = "nimbus_sub_minute_iterator"
  runtime       = "python3.13"
  role          = aws_iam_role.iterator_lambda_role.arn
  handler       = "handler.lambda_handler"
  filename      = "${path.module}/handler.zip"
  depends_on = [ 
    aws_iam_role_policy_attachment.lambda_role_policy_attachment,
    data.archive_file.function_zip
    ]
}