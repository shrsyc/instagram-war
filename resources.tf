variable "aws_access_key" {}
variable "aws_secret_key" {}


provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_security_group" "my_sg" {
  tags = {
    name = "my_sg"
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
resource "aws_instance" "server_one" {
  ami             = "ami-0f2ce9ce760bd7133"
  instance_type   = "t2.micro"
  key_name        = "203devclass"
  security_groups = [aws_security_group.my_sg.name]
  count           = "2"
  tags = {
    Name = "server_one"
  }
  user_data = file("./startup.sh")
}


output "private_ip" {
  value = aws_instance.server_one.*.private_ip
}



