output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_sg_id" {
    value = aws_security_group.alb_sg.id
  
}

output "ecs_sg_id" {
    value=aws_security_group.ecs_sg.id
  
}

output "private_subnets" {
  description = "List of private subnets"
  value       = aws_subnet.private[*].id
}

output "public_subnets" {
  description = "List of public subnets"
  value       = aws_subnet.public[*].id
}
