variable "project_name" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}

variable "owner" {
  type    = string
  default = "Darren Li"
}

variable "environment" {
  type    = string
  default = "dev"
}