provider "aws" {
  region = "us-west-2"  # Update with your desired AWS region
}

# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Define public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"  # Update with desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# Define private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"  # Update with desired AZ

  tags = {
    Name = "Private Subnet"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My IGW"
  }
}

# Attach the internet gateway to the VPC
resource "aws_vpc_attachment" "my_vpc_attachment" {
  vpc_id       = aws_vpc.my_vpc.id
  internet_gateway_id = aws_internet_gateway.my_igw.id
}