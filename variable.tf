variable "instance_type" {
  type        = string
  description = "Instance type for the ec2 instance"
  default     = "t2.micro"
}

variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
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


variable "aws_key" {
  type        = string
  description = "SSH key pair name for ex2 instance access"
  sensitive   = true
}

variable "db_username" {
  type        = string
  description = "RDS Database Username"
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "RDS Database password"
  sensitive   = true

}

variable "db_name" {
  type        = string
  description = "RDS Database name"
  sensitive   = true

}

variable "app_environment" {
  type        = string
  description = "Type of environment"
  default     = "dev"

}
