resource "aws_iam_policy" "sub_minute_iterator_state_machine_iam_policy" {
  name   = local.sub_minute_iterator_state_machine.iam.policy.name
  policy = file(local.sub_minute_iterator_state_machine.iam.policy.file_path)
}

resource "aws_iam_role" "sub_minute_iterator_state_machine_role" {
  name               = local.sub_minute_iterator_state_machine.iam.role.name
  assume_role_policy = file(local.sub_minute_iterator_state_machine.iam.role.assume_role_policy_file_path)
}

resource "aws_iam_role_policy_attachment" "step_function_role_policy_attachment" {
  policy_arn = aws_iam_policy.sub_minute_iterator_state_machine_iam_policy.arn
  role       = aws_iam_role.sub_minute_iterator_state_machine_role.name
}