output "rds_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "Endpoint do banco RDS"
}

output "rds_instance_id" {
  value       = aws_db_instance.postgres.id
  description = "ID da instância RDS"
}

output "rds_instance_arn" {
  description = "ARN da instância RDS"
  value       = aws_db_instance.postgres.arn
}