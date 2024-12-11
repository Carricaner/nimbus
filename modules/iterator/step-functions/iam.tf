resource "aws_iam_policy" "nimbus_step_function_iam_policy" {
  name   = "nimbus_step_function_iam_policy"
  policy = file("${path.module}/nimbus_step_function_iam_policy.json")
}