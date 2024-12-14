locals {
  ietrator_function_params = {
    name = "${var.project_name}_iterator_function"
    zip_file = {
      source_dir = "${path.module}/python/"
      index_file_name = "handler"
      index_file_handler = "lambda_handler"
      output_file_name = "handler_1.zip"
      output_path = "${path.module}/handler_1.zip"
    }
  }
}

data "archive_file" "iterator_function_zip" {
  type        = "zip"
  source_dir  = local.ietrator_function_params.zip_file.source_dir
  output_path = local.ietrator_function_params.zip_file.output_path
}

resource "aws_lambda_function" "iterator_function" {
  function_name = local.ietrator_function_params.name
  runtime       = "python3.13"
  role          = aws_iam_role.iterator_lambda_role.arn
  handler       = "${local.ietrator_function_params.zip_file.index_file_name}.${local.ietrator_function_params.zip_file.index_file_handler}"
  filename      = local.ietrator_function_params.zip_file.output_path
  depends_on = [ 
    aws_iam_role_policy_attachment.iterator_lambda_role_policy_attachment,
    data.archive_file.iterator_function_zip
  ]
}