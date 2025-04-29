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
# create output for insert it in ec2 run module
output "sg_id_output" {
  value = aws_security_group.myfirstsg.id
}