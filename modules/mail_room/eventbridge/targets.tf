resource "aws_cloudwatch_event_target" "step_function_target" {
  rule      = aws_cloudwatch_event_rule.dev_1_rule.name
  arn       = var.sub_minute_iterator_state_machine_arn
  role_arn  = aws_iam_role.sub_minute_iterator_target_role.arn
  event_bus_name = aws_cloudwatch_event_bus.nimbus_dev.name
  input_path = "$.detail"
}