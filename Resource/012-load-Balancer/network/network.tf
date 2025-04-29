module "share" {
  source = "../shared"
}


# Create a Security Group
resource "aws_security_group" "publicsg" {
  name = "my-first-sg"
  description = "this is a sg for ec2"
  vpc_id = module.share.vpcid

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

output "publicsg_id" {
  value = aws_security_group.publicsg.id
}
