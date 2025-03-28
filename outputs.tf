output "rds_endpoint" {
  description = "Endereco do endpoint do banco de dados"
  value       = module.rds.rds_endpoint
}

output "rds_id" {
  description = "ID da instancia RDS"
  value       = module.rds.rds_instance_id
}

output "rds_arn" {
  description = "ARN da instancia RDS"
  value       = module.rds.rds_instance_arn
}

output "vpc_id" {
  description = "ID da VPC"
  value       = module.vpc.vpc_id
}