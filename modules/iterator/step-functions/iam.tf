resource "aws_iam_policy" "nimbus_step_function_iam_policy" {
  name   = "nimbus_step_function_iam_policy"
  policy = file("${path.module}/policy/nimbus_step_function_iam_policy.json")
}

resource "aws_iam_role" "sub_min_iterator_step_function_role" {
  name               = "nimbus_sub_min_iterator_step_function_role"
  assume_role_policy = file("${path.module}/policy/nimbus_step_function_assume_role_policy.json")
}

resource "aws_iam_role_policy_attachment" "step_function_role_policy_attachment" {
  role       = aws_iam_role.sub_min_iterator_step_function_role.name
  policy_arn = aws_iam_policy.nimbus_step_function_iam_policy.arn
}