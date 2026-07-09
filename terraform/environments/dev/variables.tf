variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}


variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, test, stage, or prod."
  }
}


variable "project_name" {
  description = "Project name"
  type        = string
}