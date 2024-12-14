locals {
  policy_path = "${path.module}/policy"

  iam_policy_params = {
    iam_policy_name = "${var.project_name}_iterator_lambda_iam_policy"
    iam_polcy_file_path = "${local.policy_path}/iam_policy.json"
  }
  iam_role_params = {
    iam_role_name = "${var.project_name}_iterator_lambda_role"
    assume_role_policy_file_path = "${local.policy_path}/assume_role_policy.json"
  }
}

resource "aws_iam_policy" "iterator_lambda_iam_policy" {
  name   = local.iam_policy_params.iam_policy_name
  policy = file("${local.iam_policy_params.iam_polcy_file_path}")
}

resource "aws_iam_role" "iterator_lambda_role" {
  name               = local.iam_role_params.iam_role_name
  assume_role_policy = file("${local.iam_role_params.assume_role_policy_file_path}")
}

resource "aws_iam_role_policy_attachment" "iterator_lambda_role_policy_attachment" {
  role       = aws_iam_role.iterator_lambda_role.name
  policy_arn = aws_iam_policy.iterator_lambda_iam_policy.arn
}