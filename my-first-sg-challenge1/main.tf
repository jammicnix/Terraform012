provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-0720cb7af233b0529"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
    name        = "allow HTTPS"

    ingress {
        from_port   = 443       
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }  
    
    egress {
        from_port   = 443
        to_port     = 443       
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}