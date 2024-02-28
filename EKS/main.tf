module "vpc" {
    source                   = "./modules/vpc"
    vpc_cidr_block           = "10.0.0.0/16"
    public_subnet_cidr_block = "10.0.0.0/19"
    public_subnet_cidr_block_second =  "10.0.32.0/19"
    private_subnet_cidr_block = "10.0.64.0/19"
    private_subnet_second_cidr_block = "10.0.96.0/19"
}
module "eks" {
    source                   = "./modules/eks"
    instance_types           = "t2.small"
    node_desired             = 2
    node_max                 = 3
    node_min                 = 1
    cluster_name             = "ekscluster"
 #   private_subnet_ids = module.vpc.private_subnet_ids
#    public_subnet_ids  = module.vpc.public_subnet_ids

}

