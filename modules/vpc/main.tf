# VPC Configuration
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Public Subnet 1 in ap-south-1a
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_1_name
  }
}

# Public Subnet 2 in ap-south-1b
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_2_name
  }
}

# Private Subnet 1 in ap-south-1a
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "ap-south-1a"
  tags = {
    Name = var.private_subnet_1_name
  }
}

# Private Subnet 2 in ap-south-1b
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "ap-south-1b"
  tags = {
    Name = var.private_subnet_2_name
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.public_route_table_name
  }
}

# Private Route Table 1 in ap-south-1a
resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.private_route_table_1_name
  }
}

# Private Route Table 2 in ap-south-1b
resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.private_route_table_2_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}

# NAT Gateway for Private Subnets
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id
  tags = {
    Name = var.nat_gateway_name
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  vpc = true
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public1_association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2_association" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

# Associate Private Subnet 1 with Private Route Table 1
resource "aws_route_table_association" "private1_association" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}

# Associate Private Subnet 2 with Private Route Table 2
resource "aws_route_table_association" "private2_association" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private2.id
}

