resource "aws_security_group" "rds_sg" {
  name        = "fastfood-rds-sg"
  description = "Grupo de seguranca para o RDS"
  vpc_id      = var.vpc_id

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

resource "aws_security_group" "redis_access" {
  name        = "${var.name}-redis-sg"
  description = "Security group for Redis access"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow Redis TCP access"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    cidr_blocks      = var.allowed_cidrs
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}