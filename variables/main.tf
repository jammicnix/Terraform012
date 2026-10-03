provider "aws" {
  region = "ap-southeast-6"
}

variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  type    = bool
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["item1", "item2", "item3"]
}

variable "mymap" {
  type = map(string)
  default = {
    "key1" = "value1"
    "key2" = "value2"
    "key3" = "value3"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the vpc"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname
  }
}

output "myoutput" {
  value = aws_vpc.myvpc.id
}