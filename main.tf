terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ca-west-1"  
  
}

resource "aws_instance" "web" {
  ami           = "ami-0da914698989dc3a6" # Amazon Linux 2 (verify for your region)
  instance_type = "t3.micro"

  tags = {
    Name = "terraform-ec2"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
