output "project_name" {
  value = var.project_name
}

output "aws_region" {
  value = var.aws_region
}

output "owner" {
  value = var.owner
}

output "aws_available_zones" {
  value = data.aws_availability_zones.available
}