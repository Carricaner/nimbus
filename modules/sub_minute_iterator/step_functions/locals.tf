locals {
  sub_minute_iterator_state_machine = {
    iam = {
        policy = {
            name = "${var.project_name}_sub_minute_iterator_state_machine_iam_policy"
            file_path = "${path.module}/policy/iam_policy.json"
        }
        role = {
            name = "${var.project_name}_sub_minute_iterator_state_machine_role"
            assume_role_policy_file_path = "${path.module}/policy/assume_role_policy.json"
        }
    }
    step_functions = {
      name = "${var.project_name}_sub_minute_iterator_state_machine"
      file_path = "${path.module}/sub-minute-iterator.asl.json"
      definition = {
        iterator_lambda_function_arn = var.iterator_function_arn
      }
    }
  }
}