locals {
  iterator_function = {
    iam = {
        policy = {
            name = "${var.project_name}_iterator_function_iam_policy"
            file_path = "${path.module}/policy/iam_policy.json"
        }
        role = {
            name = "${var.project_name}_iterator_function_role"
            assume_role_policy_file_path = "${path.module}/policy/assume_role_policy.json"
        }
    }
    lambda = {
        name = "${var.project_name}_iterator_function"
        zip_file = {
            source_dir = "${path.module}/python/"
            index_file_name = "handler"
            index_file_handler = "lambda_handler"
            output_file_name = "handler_1.zip"
            output_path = "${path.module}/handler_1.zip"
        }
    }
  }
}