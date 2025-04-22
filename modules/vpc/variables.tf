variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
}

variable "vpc_name" {
  description = "The name tag to assign to the VPC"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet (e.g., in ap-south-1a)"
}

variable "public_subnet_1_name" {
  description = "Name tag for the first public subnet"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet (e.g., in ap-south-1b)"
}

variable "public_subnet_2_name" {
  description = "Name tag for the second public subnet"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet (e.g., in ap-south-1a)"
}

variable "private_subnet_1_name" {
  description = "Name tag for the first private subnet"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet (e.g., in ap-south-1b)"
}

variable "private_subnet_2_name" {
  description = "Name tag for the second private subnet"
}

variable "public_route_table_name" {
  description = "Name tag for the public route table"
}

variable "private_route_table_1_name" {
  description = "Name tag for the private route table associated with the first private subnet"
}

variable "private_route_table_2_name" {
  description = "Name tag for the private route table associated with the second private subnet"
}

variable "igw_name" {
  description = "Name tag for the Internet Gateway"
}

variable "nat_gateway_name" {
  description = "Name tag for the NAT Gateway"
}
