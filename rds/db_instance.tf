# rds/db_instance.tf

resource "aws_db_instance" "medusa_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_name              = "medusa"
  username             = "subham_21"  # Use a different username
  password             = var.db_password
  parameter_group_name = "default.postgres15"
  multi_az             = false
  publicly_accessible  = false
  tags = {
    Name = "medusa-db"
  }
}

