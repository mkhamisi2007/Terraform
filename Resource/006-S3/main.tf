provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-tf-test-bucket-181819"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "myfirstobject" {
  key = "testfile.txt"
  bucket = aws_s3_bucket.mybucket.id
  source = "./textfile.txt"

}

