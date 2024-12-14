resource "aws_iam_policy" "nimbus_event_rule_target_iam_policy" {
  name   = "nimbus_event_rule_target_iam_policy"
  policy = file("${path.module}/policy/nimbus_event_rule_target_iam_policy.json")
}

resource "aws_iam_role" "nimbus_event_rule_target_role" {
  name               = "nimbus_event_rule_target_role"
  assume_role_policy = file("${path.module}/policy/nimbus_event_rule_role_target_assume_role_policy.json")
}

resource "aws_iam_role_policy_attachment" "event_rule_target_role_policy_attachment" {
  role       = aws_iam_role.nimbus_event_rule_target_role.name
  policy_arn = aws_iam_policy.nimbus_event_rule_target_iam_policy.arn
}