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

resource "aws_iam_policy" "terraform_2024_12_09_demo_policy" {
  name   = "terraform_2024_12_09_demo_policy"
  policy = file("terraform_2024_12_09_demo_policy.json")
}