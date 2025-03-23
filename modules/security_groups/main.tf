resource "aws_security_group" "rds_sg" {
  name        = "fastfood-rds-sg"
  description = "Grupo de segurança para o RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Permite acesso apenas dentro da VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Permite tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]  # Permite tráfego de saída para qualquer lugar
  }

  tags = {
    Name = "fastfood-rds-sg"
  }
}