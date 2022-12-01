provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }

resource "aws_ebs_volume" "manoj_ebs" {
  availability_zone = "us-east-1a"
  size              = 40

  tags = {
    Name = "manoj"
  }
}


resource "aws_ebs_snapshot" "manoj_snapshot" {
  volume_id = aws_ebs_volume.manoj_ebs.id

  tags = {
    Name = "HelloWorld_snap"
  }
}

