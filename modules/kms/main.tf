resource "aws_kms_key" "this" {
  description = "Chave KMS para criptografia do banco RDS"
  tags = {
    Name = "fastfood-rds-kms-key"
  }
}