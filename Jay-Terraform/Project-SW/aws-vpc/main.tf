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

#create a vpc
 resource "aws_vpc" "jay-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "jay-vpc"
    }
   
 }

 #Private Sub
 resource "aws_subnet" "private-sub" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.jay-vpc.id
    tags = {
      Name = "private-sub"
    }
   
 }

 #Public Sub
 resource "aws_subnet" "public-sub" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.jay-vpc.id
    tags = {
      Name = "public-sub"
    }
   
 }

 #Internet IGW
 resource "aws_internet_gateway" "jay-igw" {
    vpc_id = aws_vpc.jay-vpc.id
    tags = {
      Name = "jay-igw"

    }  
 }

 
#Rout Table
resource "aws_route_table" "jay-rt" {
    vpc_id = aws_vpc.jay-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.jay-igw.id
    }
  
}

resource "aws_route_table_association" "public-subnet" {
    route_table_id = aws_internet_gateway.jay-igw.id
    subnet_id = aws_subnet.public-sub.id
  
}
