provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }


resource "aws_elb_attachment" {
  elb      = aws_lb.my-alb.id
  elb      = aws_lb.my-nlb.id
  instance = aws_instance.web-server-instance.id
  }
  
  
 resource "aws_instance" "web-server-instance" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  associate_public_ip_address = true

}

