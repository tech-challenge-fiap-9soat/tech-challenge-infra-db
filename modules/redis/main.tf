resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = var.name
  replication_group_description = "Redis cluster for ${var.name}"
  node_type                    = var.node_type
  number_cache_clusters        = 1
  automatic_failover_enabled   = false
  subnet_group_name            = aws_elasticache_subnet_group.this.name
  security_group_ids           = var.security_group_ids
  engine                      = "redis"
  engine_version              = var.engine_version
  port                        = var.port
  parameter_group_name        = var.parameter_group_name

  tags = var.tags
}