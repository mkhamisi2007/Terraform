provider "aws" {
  region = "us-east-1"
}

module "my" {
  source = "./ec2_module"
}