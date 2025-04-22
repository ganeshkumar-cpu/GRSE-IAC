output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
  description = "The ID of public subnet 1"
  value       = aws_subnet.public1.id
}

output "public_subnet_2_id" {
  description = "The ID of public subnet 2"
  value       = aws_subnet.public2.id
}

output "private_subnet_1_id" {
  description = "The ID of private subnet 1"
  value       = aws_subnet.private1.id
}

output "private_subnet_2_id" {
  description = "The ID of private subnet 2"
  value       = aws_subnet.private2.id
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.gateway.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway"
  value       = aws_nat_gateway.nat_gateway.id
}

