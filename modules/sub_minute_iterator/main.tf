module "lambda" {
  source = "./lambda"
  project_name = var.project_name
}

module "step_functions" {
  source = "./step_functions"
  project_name = var.project_name
  iterator_function_arn = module.lambda.iterator_function_arn
  depends_on = [ 
    module.lambda 
  ]
}
