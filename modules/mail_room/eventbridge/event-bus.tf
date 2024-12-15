resource "aws_cloudwatch_event_bus" "nimbus_dev" {
  name = local.mail_room.eventbridge.event_bus.name
}