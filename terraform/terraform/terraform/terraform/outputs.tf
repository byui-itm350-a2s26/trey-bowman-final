output "public_ip" {

value = aws_instance.taskmanager.public_ip

}variable "aws_region" {

default = "us-west-2"

}