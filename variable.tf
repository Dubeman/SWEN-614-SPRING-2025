# Variable definition for EC2 instance type
variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"  # Default to t2.micro if no value is provided
}

variable "app_environment" {
  type        = string
  description = "Type of environment"
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}
