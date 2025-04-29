
resource "aws_vpc" "main" {
    cidr_block = var.cidr_block

    enable_dns_support = false
    enable_dns_hostnames = false
    tags = {
      Name="${var.env}-main"
    }
  
}
resource "aws_subnet" "private-dev" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/19"
   tags = {
      Name="${var.env}-private"
    }
}