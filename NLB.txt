provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }

  
  resource "aws_lb" "NLB" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["subnet-011f698d4be6311ac"]

  enable_deletion_protection = false

}
