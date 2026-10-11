provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "db" {
    ami = "ami-0720cb7af233b0529"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = "ami-0720cb7af233b0529"
    instance_type = "t2.micro"

    depends_on = [aws_instance.db]

}