data "archive_file" "iterator_function_zip" {
  type        = "zip"
  source_dir  = local.iterator_function.lambda.zip_file.source_dir
  output_path = local.iterator_function.lambda.zip_file.output_path
}

resource "aws_lambda_function" "iterator_function" {
  function_name = local.iterator_function.lambda.name
  runtime       = "python3.13"
  role          = aws_iam_role.iterator_lambda_role.arn
  handler       = "${local.iterator_function.lambda.zip_file.index_file_name}.${local.iterator_function.lambda.zip_file.index_file_handler}"
  filename      = local.iterator_function.lambda.zip_file.output_path
  depends_on = [ 
    aws_iam_role_policy_attachment.iterator_lambda_role_policy_attachment,
    data.archive_file.iterator_function_zip
  ]
}