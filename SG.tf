resource "aws_security_group" "SG" {
  name   = "HTTP and SSH"
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }


resource "aws_instance" "my_instance" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = true

   tags = {
        Name: "my_instance"
    }
}
