variable "availability_zones" {
  description = "List of Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]  # Replace with your region's AZs
}
variable "private_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "public_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}