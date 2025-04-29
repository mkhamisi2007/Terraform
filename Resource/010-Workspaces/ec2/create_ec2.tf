variable "amiid" {
  default = "ami-012967cc5a8c9f891" # "ami-055e62b4ea2fe95fd" 
}

# varable for input outside the module
variable "sg_id" {}

#create EC2
resource "aws_instance" "myec2instance" {
  ami           = var.amiid
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.sg_id]
  key_name = "khamisi"

  tags = {
    Name = "HelloWorld"
  }
}