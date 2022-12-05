provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
  }

resource "aws_iam_policy" "ssm_policy" {
  name               = "ssm_policy"



 policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssm:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}





resource "aws_iam_role" "ec2_role" {
    name = "ec2_role"



 assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}



resource "aws_iam_role_policy_attachment" "ec2_policy_role" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ssm_policy.arn
}



resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}



resource "aws_instance" "manoj_instance" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
        Name: "manoj_ins2"
    }
}


