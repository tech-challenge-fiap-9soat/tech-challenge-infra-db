variable "db_password" {
  description = "Senha do banco"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Ambiente de deploy (dev, prod)"
  type        = string
}