provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "db" {
    ami = "ami-0720cb7af233b0529"
    instance_type = "t2.micro"

    tags = {
            Name = "BD Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-0720cb7af233b0529"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_traffic.name] 
    user_data = file("server-script.sh")
    tags = {
            Name = "Web Server"
    }
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
}

variable "inegress" {
    type = list(number)
    default = [80, 443]
}

variable "iegress" {
    type = list(number)
    default = [80,443 ]
}

resource "aws_security_group" "web_traffic" {
    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.inegress

        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }   

    dynamic "egress" {
        iterator = port
        for_each = var.iegress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
output "PrivateIP" {
    value = aws_instance.web.private_ip
}   

output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}   