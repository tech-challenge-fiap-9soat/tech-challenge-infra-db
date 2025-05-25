variable "name" {
  type        = string
  description = "Name prefix for Redis resources"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets where Redis will be deployed"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups attached to Redis"
}

variable "node_type" {
  type        = string
  default     = "cache.t3.micro"
}

variable "engine_version" {
  type        = string
  default     = "7.0"
}

variable "port" {
  type        = number
  default     = 6379
}

variable "parameter_group_name" {
  type        = string
  default     = "default.redis7"
}

variable "tags" {
  type        = map(string)
  default     = {}
}