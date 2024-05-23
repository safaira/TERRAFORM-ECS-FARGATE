
resource "aws_ecs_task_definition" "ecs_task" {
  family = "service"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = aws_iam_role.fargate.arn
  network_mode = "awsvpc"
  cpu       = 1024
  memory    = 512

  container_definitions = jsonencode([
    {
      name      = "Hello-World"
      image     = "${aws_ecr_repository.nodejs_image.repository_url}",
      cpu       = 1024
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    },
    
  ])

  # volume {
  #   name      = "service-storage"
  #   host_path = "/ecs/service-storage"
  # }

}