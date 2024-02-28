variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

#secrets ----------------------------------------------------------------------
variable "access_key" {
#   default     = "AKIA4MTWGULZ2PNIAJM4"
  description = "access key"
}
variable "secret_key" {
#   default     = "esD8J0NuklLk6AIa4dC1gOBL6bfS3+6g+xmrjQ0o"
  description = "secret key"
}
# Define variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
}
variable "private_subnet_second_cidr_block" {
  description = "CIDR block for the second private subnet"
}

# Cluster creation ----------------------------------------------------------------------
# Variables
variable "cluster_name" {}
variable "node_instance_type" {}
variable "min_nodes" {}
variable "max_nodes" {}
variable "node_labels" {
  type = map(string)
}
variable "subnet_ids" {
  type = list
}
variable "desired_nodes" {}