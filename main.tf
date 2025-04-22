provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr                  = var.vpc_cidr
  vpc_name                  = var.vpc_name
  public_subnet_1_cidr      = var.public_subnet_1_cidr
  public_subnet_1_name      = var.public_subnet_1_name
  public_subnet_2_cidr      = var.public_subnet_2_cidr
  public_subnet_2_name      = var.public_subnet_2_name
  private_subnet_1_cidr     = var.private_subnet_1_cidr
  private_subnet_1_name     = var.private_subnet_1_name
  private_subnet_2_cidr     = var.private_subnet_2_cidr
  private_subnet_2_name     = var.private_subnet_2_name
  public_route_table_name   = var.public_route_table_name
  private_route_table_1_name = var.private_route_table_1_name
  private_route_table_2_name = var.private_route_table_2_name
  igw_name                  = var.igw_name
  nat_gateway_name          = var.nat_gateway_name
}
module "ec2_instances" {
  source = "./modules/ec2"

  ec2_instances = var.ec2_instances
  key_name      = var.key_name
  subnet_map    = var.subnet_map
  sg_map        = var.sg_map
}

module "security_groups" {
  source = "./modules/security_group"
  security_groups = var.security_groups
}
