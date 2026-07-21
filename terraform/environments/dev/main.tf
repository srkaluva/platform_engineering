module "network" {
  source = "../../modules/network"

  name = "platform-dev"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "us-west-2a",
    "us-west-2b"
  ]

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnets = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  tags = {
    Project     = "platform-engineering"
    Environment = "dev"
    Owner       = "Santosh"
    ManagedBy   = "Terraform"
  }
}

module "iam" {
  source = "../../modules/iam"

  role_name = "test-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  policy_arns = []
  tags        = {}
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = "platform-dev"
  kubernetes_version = "1.33"

  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnets

  tags = {
    Project     = "platform-engineering"
    Environment = "dev"
    Owner       = "Santosh"
    ManagedBy   = "Terraform"
  }
}

locals {
  repositories = [
    "platform-demo/frontend",
    "platform-demo/payment"
  ]
}

module "ecr" {
  for_each = toset(local.repositories)

  source = "../../modules/ecr"

  repository_name = each.value

  tags = {
    Project     = "platform-engineering"
    Environment = "dev"
  }
}