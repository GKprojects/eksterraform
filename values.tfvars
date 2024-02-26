vpc_cidr_block           = "10.0.0.0/16"
public_subnet_cidr_block = "10.0.1.0/24"
private_subnet_cidr_block = "10.0.2.0/24"

#cluster details
cluster_name        = "my-cluster"
node_instance_type  = "t3.medium"
min_nodes           = 2
max_nodes           = 3

# Node labels
node_labels = {
  environment = "production"
  role        = "worker"
}

# VPC settings
vpc_cidr_block = "10.0.0.0/16"
