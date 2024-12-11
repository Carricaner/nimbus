module "lambda" {
  source = "./lambda"
}

module "step_functions" {
  source = "./step-functions"
}