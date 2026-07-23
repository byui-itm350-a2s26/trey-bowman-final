terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }

}


provider "aws" {

  region = "us-west-2"

}
resource "aws_security_group" "taskmanager_sg" {


  name = "taskmanager-security-group"


  ingress {

    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
resource "aws_instance" "taskmanager" {


  ami = "ami-05134c8ef96964280"


  instance_type = "t2.micro"


  security_groups = [
    aws_security_group.taskmanager_sg.name
  ]


  user_data = file("userdata.sh")


  tags = {

    Name = "TaskManager"

  }


}