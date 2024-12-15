module "eventbridge" {
  source = "./eventbridge"
  project_name = var.project_name
  environment = var.environment
  sub_minute_iterator_state_machine_arn = var.sub_minute_iterator_state_machine_arn
}