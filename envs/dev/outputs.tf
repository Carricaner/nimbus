output "output_info" {
  value = {
    "project_name" = var.project_name
    "owner"        = var.owner
    "environment"  = var.environment
    "aws_region"   = var.aws_region
  }
}