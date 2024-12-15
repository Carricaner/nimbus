resource "aws_scheduler_schedule" "nimbus_dev_scheduler" {
  name       = "${var.project_name}_${var.environment}_scheduler"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "cron(* * 16,17 * ? *)"
  schedule_expression_timezone = "Asia/Taipei"

  target {
    arn      = aws_cloudwatch_event_bus.nimbus_dev.arn
    role_arn = aws_iam_role.scheduler_role.arn
    eventbridge_parameters {
      detail_type = "com.twen"
      source = "com.twen"
    }
    input = jsonencode({
      "index"= 10
      "count"= 12
      "targets": [
        {
          "type"= "aws-lambda"
          "function_name"= "canada-calculator"
          "payload"= {
            "data"= "twen"
          }
        }
      ]
    })
  }
}