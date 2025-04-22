variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "gcc-vpc-facial-vpc"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the public subnet 1"
  type        = string
  default     = "10.0.0.0/20"
}

variable "public_subnet_1_name" {
  description = "The name for public subnet 1"
  type        = string
  default     = "gcc-vpc-facial-subnet-public1-ap-south-1a"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the public subnet 2"
  type        = string
  default     = "10.0.16.0/20"
}

variable "public_subnet_2_name" {
  description = "The name for public subnet 2"
  type        = string
  default     = "gcc-vpc-facial-subnet-public2-ap-south-1b"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the private subnet 1"
  type        = string
  default     = "10.0.128.0/20"
}

variable "private_subnet_1_name" {
  description = "The name for private subnet 1"
  type        = string
  default     = "gcc-vpc-facial-subnet-private1-ap-south-1a"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the private subnet 2"
  type        = string
  default     = "10.0.144.0/20"
}

variable "private_subnet_2_name" {
  description = "The name for private subnet 2"
  type        = string
  default     = "gcc-vpc-facial-subnet-private2-ap-south-1b"
}

variable "public_route_table_name" {
  description = "The name for the public route table"
  type        = string
  default     = "gcc-vpc-facial-rtb-public"
}

variable "private_route_table_1_name" {
  description = "The name for private route table 1"
  type        = string
  default     = "gcc-vpc-facial-rtb-private1-ap-south-1a"
}

variable "private_route_table_2_name" {
  description = "The name for private route table 2"
  type        = string
  default     = "gcc-vpc-facial-rtb-private2-ap-south-1b"
}

variable "igw_name" {
  description = "The name for the internet gateway"
  type        = string
  default     = "gcc-vpc-facial-igw"
}

variable "nat_gateway_name" {
  description = "The name for the NAT Gateway"
  type        = string
  default     = "gcc-vpc-facial-nat-public1-ap-south-1a"
}

