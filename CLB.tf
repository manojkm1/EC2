provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }


resource "aws_elb" "my-elb" {
  name               = "my-elb"
  availability_zones = ["us-east-1a"]

  access_logs {
    bucket        = "manoj1258"
    bucket_prefix = "manoj"
    interval      = 60
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.web-server-instance.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}

resource "aws_instance" "web-server-instance" {
  ami = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "my-keypair"
}
