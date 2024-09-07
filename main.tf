module "vpc" {
  source = "/Users/subham/Documents/medusa-deployment/vpc"


  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  availability_zones         = var.availability_zones
}

module "ecs" {
  source  = "/Users/subham/Documents/medusa-deployment/ecs"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  db_password=var.db_password
  alb_sg=module.vpc.alb_sg_id
  public_subnets = module.vpc.public_subnets
  db_endpoint=module.rds.db_endpoint
  ecs_sg=module.vpc.ecs_sg_id
}

module "rds" {
  source      = "/Users/subham/Documents/medusa-deployment/rds"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.private_subnets
  private_subnets= module.vpc.private_subnets
  public_subnets= module.vpc.public_subnets
  db_password = var.db_password
}
