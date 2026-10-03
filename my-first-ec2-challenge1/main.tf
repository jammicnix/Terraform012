provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-0720cb7af233b0529"
    instance_type = "t2.micro"
}