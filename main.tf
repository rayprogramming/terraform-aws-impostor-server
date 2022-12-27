terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Project   = "Impostor"
      CreatedBy = "rayprogramming/Impostor"
      ManagedBy = "Terraform"
    }
  }
}