vpc_cidr_block           = "10.0.0.0/16"
public_subnet_cidr_block = "10.0.0.0/18"
private_subnet_cidr_block = "10.0.64.0/18"
private_subnet_second_cidr_block = "10.0.128.0/18"

access_key = ""
secret_key = ""
subnet_availability_zone = 
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
desired_nodes = "2"