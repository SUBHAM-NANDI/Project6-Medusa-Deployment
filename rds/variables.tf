variable "subnets" {
  description = "List of subnets for ECS service"
  type        = list(string)
}
variable "private_subnets" {
  description = "List of private subnets for RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for RDS"
  type        = string
}

variable "db_password" {
  default = ""
}

variable "public_subnets" {
  description = "List of public subnets for ECS tasks"
  type        = list(string)
}

