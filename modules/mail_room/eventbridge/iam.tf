resource "aws_iam_policy" "sub_minute_iterator_target_iam_policy" {
  name   = "${var.project_name}_sub_minute_iterator_target_iam_policy"
  policy = file("${path.module}/policy/iam_policy.json")
}

resource "aws_iam_policy" "scheduler_iam_policy" {
  name   = "${var.project_name}_scheduler_iam_policy"
  policy = file("${path.module}/policy/scheduler_iam_policy.json")
}

resource "aws_iam_role" "sub_minute_iterator_target_role" {
  name               = "${var.project_name}_sub_minute_iterator_target_role"
  assume_role_policy = file("${path.module}/policy/assume_role_policy.json")
}

resource "aws_iam_role" "scheduler_role" {
  name               = "${var.project_name}_scheduler_role"
  assume_role_policy = file("${path.module}/policy/assume_role_policy.json")
}

resource "aws_iam_role_policy_attachment" "event_rule_target_role_policy_attachment" {
  role       = aws_iam_role.sub_minute_iterator_target_role.name
  policy_arn = aws_iam_policy.sub_minute_iterator_target_iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "scheduler_role_policy_attachment" {
  role       = aws_iam_role.scheduler_role.name
  policy_arn = aws_iam_policy.scheduler_iam_policy.arn
}