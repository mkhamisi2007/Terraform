provider "aws" {
    region = "us-east-1" 
}


module "loadbalancer" {
  source = "./loadbalancer"
}