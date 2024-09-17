 terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
     random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
 
 resource "aws_s3_bucket" "jay-bucket" {
    bucket = "jay-bucket1213"
   
 }

#  resource "aws_s3_object" "my-demo" {
#     bucket = jay-bucket1213.bucket
#     source = "./myfile.txt"
#     key = "mydata.txt"
   
#  }