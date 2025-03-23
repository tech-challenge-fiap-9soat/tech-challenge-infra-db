output "private_subnets" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  description = "IDs das subnets"
}

output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.this.id
}