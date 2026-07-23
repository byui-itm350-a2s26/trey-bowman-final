variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-west-2"
}


variable "instance_type" {
  description = "EC2 instance size"
  type        = string
  default     = "t2.micro"
}


variable "project_name" {
  description = "Name of the application"
  type        = string
  default     = "taskmanager"
}