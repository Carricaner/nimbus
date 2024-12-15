resource "aws_cloudwatch_event_rule" "dev_1_rule" {
  name        = "${var.project_name}_dev_1_rule"
  event_bus_name = aws_cloudwatch_event_bus.nimbus_dev.name

  event_pattern = jsonencode(
    {
      source = ["com.twen"]
      detail-type = ["com.twen"]
    })
}