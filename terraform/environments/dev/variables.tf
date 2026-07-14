variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-west-2"
}


variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, test, stage, or prod."
  }
}


variable "project_name" {
  description = "Project name"
  type        = string
  default     = "Platform_dev"
}