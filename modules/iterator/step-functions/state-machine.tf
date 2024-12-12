module "lambda" {
  source = "../lambda"
}

resource "aws_sfn_state_machine" "sub_min_iterator_state_machine" {
  name     = "nimbus_sub_min_iterator_state_machine"
  role_arn = aws_iam_role.sub_min_iterator_step_function_role.arn

  definition = templatefile(
    "${path.module}/sub-minute-iterator.asl.json", 
    {
        iterator_lambda_function_arn = module.lambda.sub_minute_iterator_lambda_function_arn
    })
}