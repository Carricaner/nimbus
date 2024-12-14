resource "aws_sfn_state_machine" "sub_minute_iterator_state_machine" {
  name     = local.sub_minute_iterator_state_machine.step_functions.name
  role_arn = aws_iam_role.sub_minute_iterator_state_machine_role.arn

  definition = templatefile(
    local.sub_minute_iterator_state_machine.step_functions.file_path, 
    local.sub_minute_iterator_state_machine.step_functions.definition
  )
}