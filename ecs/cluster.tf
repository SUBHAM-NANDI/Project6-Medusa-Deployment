resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}

resource "aws_lb" "medusa" {
  name               = "medusa-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg]
  subnets          = var.subnets

  enable_deletion_protection = false
  

  tags = {
    Name = "medusa-lb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.medusa.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.medusa_target_group.arn
  }
}

resource "aws_lb_target_group" "medusa_target_group" {
  name     = "medusa-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
  health_check {
    path = "/"
    interval=30
    timeout=5
    healthy_threshold = 3
    unhealthy_threshold = 3
  }

}

resource "aws_ecs_service" "medusa_service" {
    name         = "medusa-service"
  cluster        = aws_ecs_cluster.medusa_cluster.id
  desired_count  = 1
  launch_type    = "FARGATE"
  task_definition = aws_ecs_task_definition.medusa_task.arn

  network_configuration {
    subnets         = var.subnets
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }


  load_balancer {
    target_group_arn = aws_lb_target_group.medusa_target_group.arn
    container_name   = "medusa-container"
    container_port   = 80
  }
}
