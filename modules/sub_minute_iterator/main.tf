module "lambda" {
  source = "./lambda"
  project_name = var.project_name
  environment = var.environment
}

module "step_functions" {
  source = "./step_functions"
  project_name = var.project_name
  iterator_function_arn = module.lambda.iterator_function_arn
  environment = var.environment
  depends_on = [ 
    module.lambda 
  ]
}
