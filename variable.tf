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


variable "aws_access_key_id" {
  description = "The AWS access key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "The AWS secret access key"
  type        = string
  sensitive   = true
}
