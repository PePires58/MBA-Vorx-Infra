module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Vorx-vpc-PROD"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = true

  default_route_table_propagating_vgws = []

  tags = {
    Name        = "Vorx-vpc-PROD"
    Environment = "prod"
  }
}
