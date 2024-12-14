resource "aws_iam_policy" "iterator_lambda_iam_policy" {
  name   = local.iterator_function.iam.policy.name
  policy = file(local.iterator_function.iam.policy.file_path)
}

resource "aws_iam_role" "iterator_lambda_role" {
  name               = local.iterator_function.iam.role.name
  assume_role_policy = file(local.iterator_function.iam.role.assume_role_policy_file_path)
}

resource "aws_iam_role_policy_attachment" "iterator_lambda_role_policy_attachment" {
  policy_arn = aws_iam_policy.iterator_lambda_iam_policy.arn
  role       = aws_iam_role.iterator_lambda_role.name
}