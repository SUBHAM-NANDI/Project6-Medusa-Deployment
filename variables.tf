variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "db_password" {
    description = "Password for the RDS instance"
  type        = string
}
# variables.tf

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones to use"
  type        = list(string)
}
