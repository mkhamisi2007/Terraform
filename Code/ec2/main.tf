provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-063d43db0594b521b"  # Change to a valid AMI ID for your region
  instance_type = "t2.micro"  # Change to your desired instance type

  tags = {
    Name = "MyEC2Instance"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}