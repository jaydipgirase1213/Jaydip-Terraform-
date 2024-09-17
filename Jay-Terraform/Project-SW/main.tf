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
 
 resource "aws_s3_bucket" "jay-myweb" {
    bucket = "myweb-buckend"
   
 }

 resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.jay-myweb.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "myweb" {
    bucket = aws_s3_bucket.jay-myweb.id
    policy = jsonencode(
        {
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject"
            Resource = "arn:aws:s3:::${aws_s3_bucket.jay-myweb.id}/*"
            
        }
    ]
}

    )
  
}


  resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.jay-myweb.bucket
    source = "./index.html"
    key = "index.html"
    content_type = "text/html"
   
 }
 resource "aws_s3_object" "styles_css" {
    bucket = aws_s3_bucket.jay-myweb.bucket
    source = "./styles.css"
    key = "styles.css"
    content_type = "text/css"
   
 }
 output "Name" {
    value = aws_s3_bucket.jay-myweb.website_endpoint
   
 }