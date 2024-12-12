resource "aws_cloudwatch_event_rule" "nimbus_dev_1_rule" {
  name        = "nimbus-dev-1-rule"
  event_bus_name = aws_cloudwatch_event_bus.nimbus_dev.name

  event_pattern = jsonencode(
    {
        source = ["com.twen"]
        detail-type = ["com.twen"]
    })
}