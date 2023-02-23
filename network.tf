## use vpc module to create two public subnets in diffrent AZ's
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.77.0"
  name                 = "rds_vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

## subnet group to attack to RDS Instance
resource "aws_db_subnet_group" "rds_postgres" {
  name       = "rds_postgres"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "rds_postgres"
  }
}

# Security group for posgres traffic
resource "aws_security_group" "postgres_sec_group" {
  name        = "rds_sec_group"
  vpc_id      = module.vpc.vpc_id
  description = "Security group for RDS instance"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
