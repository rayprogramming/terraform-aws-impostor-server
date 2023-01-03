terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

data "aws_route53_zone" "zone" {
  zone_id = var.zone_id
}