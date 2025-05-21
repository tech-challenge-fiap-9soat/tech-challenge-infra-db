module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "kms" {
  source = "./modules/kms"
}

module "rds" {
  source               = "./modules/rds"
  db_identifier        = "fastfood-db"
  db_instance_class    = "db.t3.micro"
  db_allocated_storage = 5
  db_max_allocated_storage = 10
  db_name              = "fastfood"
  db_username          = "postgres"
  db_password          = var.db_password
  security_group_ids   = [module.security_groups.rds_sg_id]
  subnet_ids           = module.vpc.private_subnets
  environment          = var.environment
  kms_key_id           = module.kms.key_id
}

module "rds" {
  source               = "./modules/rds"
  db_identifier        = "fastfood-payments-db"
  db_instance_class    = "db.t3.micro"
  db_allocated_storage = 5
  db_max_allocated_storage = 10
  db_name              = "payments"
  db_username          = "postgres"
  db_password          = var.db_password
  security_group_ids   = [module.security_groups.rds_sg_id]
  subnet_ids           = module.vpc.private_subnets
  environment          = var.environment
  kms_key_id           = module.kms.key_id
}
