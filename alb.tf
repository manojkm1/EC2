provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }


resource "aws_s3_bucket" "manoj1258" {
  bucket = "manoj1258"

}


resource "aws_lb" "my-LB" {
  name               = "my-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-039bb450c7621c290"]
  subnets            = ["subnet-011f698d4be6311ac","subnet-06da87741c7d8db5a"]

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.manoj1258.bucket
    prefix  = "manoj"
    enabled = true
  }

}


  
