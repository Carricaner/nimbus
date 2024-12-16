provider "aws" {
  region = var.aws_region
}

module "sub_minute_iterator" {
  source       = "../../modules/sub_minute_iterator"
  project_name = var.project_name
  environment  = var.environment
}

module "mail_room" {
  source                                = "../../modules/mail_room"
  project_name                          = var.project_name
  environment                           = var.environment
  sub_minute_iterator_state_machine_arn = module.sub_minute_iterator.sub_min_iterator_state_machine_arn
}