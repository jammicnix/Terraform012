resource "aws_instance" "db" {
    ami = "ami-0720cb7af233b0529"
    instance_type = "t2.micro"

    tags = {
            Name = "BD Server"
    }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}