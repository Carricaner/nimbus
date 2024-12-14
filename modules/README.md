## For Mail-room
- Got from ChatGPT
- To check if there's alraedy been a custom event bus in my AWS account.

```hcl
# Data source to check if the event bus exists
data "aws_cloudwatch_event_bus" "existing" {
  name = "nimbus-dev-1"

  # Ignore data source errors to allow conditional creation
  lifecycle {
    ignore_errors = true
  }
}

# Resource to create the event bus if it doesn't exist
resource "aws_cloudwatch_event_bus" "create_if_missing" {
  count = data.aws_cloudwatch_event_bus.existing.id != "" ? 0 : 1

  name = "nimbus-dev-1"
}

# Reference the event bus name dynamically
locals {
  event_bus_name = coalesce(data.aws_cloudwatch_event_bus.existing.name, aws_cloudwatch_event_bus.create_if_missing[0].name)
}

# Rule attached to the event bus
resource "aws_cloudwatch_event_rule" "example_rule" {
  name               = "nimbus-dev-1-rule"
  event_bus_name     = local.event_bus_name
  event_pattern      = jsonencode({
    "detail-type": ["com.twen"],
    "source":      ["com.twen"]
  })
}

# Target attached to the rule
resource "aws_cloudwatch_event_target" "example_target" {
  rule          = aws_cloudwatch_event_rule.example_rule.name
  event_bus_name = local.event_bus_name
  arn           = module.state_functions.sub_min_iterator_state_machine_arn

  role_arn      = data.aws_iam_role.existing_role.arn

  input_transformer {
    input_paths = {
      input = "$.detail"
    }

    input_template = <<EOF
    {
      "input": <input>
    }
    EOF
  }
}

# IAM Role for the rule target
data "aws_iam_role" "existing_role" {
  name = "2024-11-30-my-demo-eventbridge-role"
}
```