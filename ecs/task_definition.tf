resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "medusa-container",
      image     = "medusajs/medusa:v1",
      essential = true,
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      environment = [
        {
          name  = "MEDUSA_BACKEND_DATABASE_URL"
          value = "postgres://${var.db_user}:${var.db_password}@${var.db_endpoint}:5432/medusa"
        }
      ]
    }
  ])
}
