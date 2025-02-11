variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key_id" {
  description = "AWS access key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
}

variable "aws_key" {
  description = "SSH key pair name for EC2 instance access"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}