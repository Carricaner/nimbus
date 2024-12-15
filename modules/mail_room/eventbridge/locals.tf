locals {
  mail_room = {
    eventbridge = {
        event_bus = {
            name = "${var.project_name}-${var.environment}"
        }
    }
  }
}