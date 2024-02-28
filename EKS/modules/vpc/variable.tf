variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}
# Define variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
}
variable "public_subnet_cidr_block_second" {
  description = "CIDR block for the second public subnet"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
}
variable "private_subnet_second_cidr_block" {
  description = "CIDR block for the second private subnet"
}
