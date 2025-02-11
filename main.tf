provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "dev/terraform.tfstate"
    region         = var.aws_region
    access_key     = var.aws_access_key_id
    secret_key     = var.aws_secret_access_key
  }
}

locals {
  aws_key = var.aws_key
}

resource "aws_security_group" "allow_http_https_ssh" {
  name        = "allow_http_https_ssh"
  description = "Allow HTTP, HTTPS, and SSH traffic"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_server" {
  ami                    = data.aws_ami.amazonlinux.id  # Amazon Linux 2 AMI ID (update as needed)
  instance_type          = var.instance_type            # Free-tier eligible instance type
  key_name               = local.aws_key                # SSH key pair name
  associate_public_ip_address = true                    # Ensure public IP is assigned
  vpc_security_group_ids = [aws_security_group.allow_http_https_ssh.id]  # Attach the security group
  user_data              = file("wp_install.sh")        # Execute wp_install.sh upon startup

  tags = {
    Name = "my-ec2-instance"
  }
}

output "public_ip" {
  value       = aws_instance.my_server.public_ip
  description = "Public IP of the EC2 instance"
}