terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "example_server" {
  ami           = "ami-00b91a0039cc72484"
  instance_type = "t2.micro"
  tags = {
    Name = "khamisiBlogExample"
  }
}