variable "vpc_id" {
  description = "Id da vpc"
  type        = string
}

variable "allowed_cidrs" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}