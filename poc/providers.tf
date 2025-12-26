terraform {
  required_version = "~> v1.14.0"
  backend "s3" {
    bucket = "oleksii-kalinin-poc-20251223152123865700000001"
    key    = "poc.tfstate"
    region = "us-east-1" # Override with AWS_REGION env var
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "dev"
    }
  }
}
