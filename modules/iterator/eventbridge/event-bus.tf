module "state_functions" {
  source = "../step-functions"
}

resource "aws_cloudwatch_event_bus" "nimbus_dev" {
  name = "nimbus-dev"
}