variable "subnets" {
  description = "List of subnets for ECS service"
  type        = list(string)
}
variable "db_user" {
  default = "admin"
}
variable "db_password" {
    default = "MyS3cur3Passw0rd!"
}
variable "db_endpoint" {
  
}
variable "ecs_sg" {
  description = "Security group for ECS service"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for ECS tasks"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for ECS"
  type        = string
}

variable "alb_sg" {
  description = "Security group for ALB"
  type        = string
}

