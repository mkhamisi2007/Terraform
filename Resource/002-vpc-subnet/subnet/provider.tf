provider "aws" {
  region = var.region
}

terraform {
  required_version = ">=1.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.56"
    }
  }
}
