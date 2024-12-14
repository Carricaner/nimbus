# resource "aws_cloudwatch_event_target" "step_function_target" {
#   rule      = aws_cloudwatch_event_rule.nimbus_dev_1_rule.name
#   event_bus_name = aws_cloudwatch_event_bus.nimbus_dev.name
#   arn       = module.state_functions.sub_min_iterator_state_machine_arn
#   role_arn  = aws_iam_role.nimbus_event_rule_target_role.arn

#   input_path = "$.detail"
# }