resource "aws_iam_policy" "nimbus_lambda_iam_policy" {
  name   = "nimbus_lambda_iam_policy"
  policy = file("${path.module}/policy/nimbus_lambda_iam_policy.json")
}

resource "aws_iam_role" "iterator_lambda_role" {
  name               = "nimbus_iterator_lambda_role"
  assume_role_policy = file("${path.module}/policy/nimbus_lambda_assume_role_policy.json")
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy_attachment" {
  role       = aws_iam_role.iterator_lambda_role.name
  policy_arn = aws_iam_policy.nimbus_lambda_iam_policy.arn
}