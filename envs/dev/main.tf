provider "aws" {
  region = var.aws_region
}

module "sub_minute_iterator" {
  source       = "../../modules/sub_minute_iterator"
  project_name = var.project_name
}