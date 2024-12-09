terraform {
  backend "s3" {
    bucket         = "myoptions-v2"
    key            = "project/nimbus/terraform/state/dev/terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
    dynamodb_table = "nimbus-dev-lock"
  }
}