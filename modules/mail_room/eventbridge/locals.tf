locals {
  name_prefix = "${var.project_name}_${var.environment}"

  mail_room = {
    eventbridge = {
        event_bus = {
            name = "${local.name_prefix}"
        }
    }
  }
}