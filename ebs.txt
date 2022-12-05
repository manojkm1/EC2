provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }


resource "aws_ebs_volume" "my-ebs" {
  availability_zone = "us-east-1a"
  size              = 1

  tags = {
    Name = "manoj${count.index}"
  }
}


resource "aws_instance" "web-server-instance" {
  ami               = "ami-0b0dcb5067f052a63"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"

  tags = {
    Name = "ec2"
  }
}

s
resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.my-ebs.id
  instance_id = aws_instance.web-server-instance.id
}



