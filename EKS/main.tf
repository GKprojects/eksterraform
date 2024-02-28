module "eks" {
    source                  = "./modules/vpc"
    vpc_cidr_block = "10.0.0.0/16"
    public_subnet_cidr_block = "10.0.0.0/19"
    public_subnet_cidr_block_second =  "10.0.32.0/19"
    private_subnet_cidr_block = "10.0.64.0/19"
    private_subnet_second_cidr_block = "10.0.96.0/19"
}