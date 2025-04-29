provider "aws" {
  region = "us-east-1"
}

//varable defination
variable "firststring" {
  type = string
  default = "this is my first string"
}

variable "multilinestring" {
  type = string
  default = <<EOH
  this is a multi line
  string
  newline
  EOH
}

variable "mapval" {
  type = map
  default = {
    "useast" = "ami1"
    "euwest" = "ami2"
  }
}

variable "listval" {
  type = list
  default = ["sg1","sg2","sg3"]
}
variable "testbool" {
  type = bool
  default = true
}

variable "inputvar" {
  type = string
}

//output defination
output "myfirstoutput" {
  value = "${var.firststring}"
}

output "mymultilineoutput" {
  value = "${var.multilinestring}"
}

output "mapout" {
  value = "${var.mapval["useast"]}"
}

output "listout" {
  value = "${var.listval[0]}"
}

output "listout2" {
  value = "${var.listval}"
}

output "boolout" {
  value = "${var.testbool}"
}

output "outinput" {
  value = "${var.inputvar}"
}

output "outinput2" {
  sensitive = true
  value = "${var.inputvar}"
}