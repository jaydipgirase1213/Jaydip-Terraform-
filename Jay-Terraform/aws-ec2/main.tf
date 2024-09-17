
  terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myubantu" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.medium"
     
     tags = {
       Name = "Jayinstance"
     }

}