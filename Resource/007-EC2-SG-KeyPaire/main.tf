provider "aws" {
  region = "us-east-1"
}
# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }

variable "vpcid" {
    type = string
    default = "vpc-044d5e3bdaad93ab5"
}

# Create a Security Group
resource "aws_security_group" "myfirstsg" {
  name = "my-first-sg"
  description = "this is a sg for ec2"
  vpc_id = "${var.vpcid}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "amiid" {
  default = "ami-012967cc5a8c9f891" # "ami-055e62b4ea2fe95fd" 
}

#create EC2
resource "aws_instance" "myec2instance" {
  ami           = var.amiid
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.myfirstsg.id]
  key_name = "khamisi"

  tags = {
    Name = "HelloWorld"
  }
}