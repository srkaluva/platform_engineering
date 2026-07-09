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