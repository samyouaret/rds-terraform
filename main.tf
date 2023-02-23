terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

data "aws_availability_zones" "available" {}

## PROVIDERS
provider "aws" {
  region = "us-east-1"
}