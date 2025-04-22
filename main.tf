provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr                 = "10.0.0.0/16"
  vpc_name                 = "gcc-vpc-facial-vpc"
  public_subnet_1_cidr     = "10.0.0.0/20"
  public_subnet_1_name     = "gcc-vpc-facial-subnet-public1-ap-south-1a"
  public_subnet_2_cidr     = "10.0.16.0/20"
  public_subnet_2_name     = "gcc-vpc-facial-subnet-public2-ap-south-1b"
  private_subnet_1_cidr    = "10.0.128.0/20"
  private_subnet_1_name    = "gcc-vpc-facial-subnet-private1-ap-south-1a"
  private_subnet_2_cidr    = "10.0.144.0/20"
  private_subnet_2_name    = "gcc-vpc-facial-subnet-private2-ap-south-1b"
  public_route_table_name  = "gcc-vpc-facial-rtb-public"
  private_route_table_1_name = "gcc-vpc-facial-rtb-private1-ap-south-1a"
  private_route_table_2_name = "gcc-vpc-facial-rtb-private2-ap-south-1b"
  igw_name                 = "gcc-vpc-facial-igw"
  nat_gateway_name         = "gcc-vpc-facial-nat-public1-ap-south-1a"
}

