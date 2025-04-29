provider "aws" {
  region = "us-east-1"
}

module "sg_module" {
  source = "./securitygroup"
}

module "ec2_module" {
  # send sg_it to ec2 module
  sg_id = module.sg_module.sg_id_output
  source = "./ec2"
}
