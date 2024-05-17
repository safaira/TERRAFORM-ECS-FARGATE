
resource "aws_ecs_task_definition" "ecs_task" {
  family = "aws_ecs_task_definition-1"
#  execution_role_arn = 
  network_mode = "awsvpc"

  container_definitions = jsonencode([
    {
      name      = "Hello-World"
# image     = "service-first"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
    },
    
  ])

  # volume {
  #   name      = "service-storage"
  #   host_path = "/ecs/service-storage"
  # }

}