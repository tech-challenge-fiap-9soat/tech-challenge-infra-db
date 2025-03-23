resource "aws_db_instance" "postgres" {
  engine                 = "postgres"
  engine_version         = "15.3"
  identifier             = var.db_identifier
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  max_allocated_storage  = 10
  storage_type           = "gp2"
  storage_encrypted      = true
  kms_key_id             = var.kms_key_id
  publicly_accessible    = false
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  backup_retention_period = 0  # Desativa backups automáticos (ativar 3 dias em ambiente produtivo)
  deletion_protection    = false  # False para desburocratizar a exclusão em teste
  multi_az               = false  # Desativa alta disponibilidade (Mais barato)
  auto_minor_version_upgrade = true
  apply_immediately      = false  # Evita downtime inesperado

  tags = {
    Name        = var.db_identifier
    Environment = var.environment
  }
}

resource "aws_db_parameter_group" "postgres_parameter_group" {
  name   = "${var.db_identifier}-pg"
  family = "postgres15"

  lifecycle {
    replace_triggered_by = [aws_db_subnet_group.rds_subnet_group]
  }

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "work_mem"
    value = "65536"
  }

  tags = {
    Name        = "${var.db_identifier}-pg"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  lifecycle {
    replace_triggered_by = [aws_db_subnet_group.rds_subnet_group]
  }

  tags = {
    Name = "${var.db_identifier}-subnet-group"
  }
}