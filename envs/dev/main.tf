provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  all_availability_zones = true

  filter {
    name   = "opt-in-status"
    values = ["not-opted-in", "opted-in"]
  }
}

module "iterator" {
  source = "../../modules/iterator"
}