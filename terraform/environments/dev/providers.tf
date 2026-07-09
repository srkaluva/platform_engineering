provider "aws" {
  region = var.aws_region
  profile = "santosh"

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      Owner       = "platform_eng"
      ManagedBy   = "Terraform"
    }
  }
}
