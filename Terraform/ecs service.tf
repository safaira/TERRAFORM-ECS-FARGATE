
resource "aws_ecs_service" "ecs_service" {
  name               = "nodejs_hello_world"
  cluster            = aws_ecs_cluster.cluster.id
  platform_version   = "LATEST"
  task_definition    = aws_ecs_task_definition.ecs_task.arn
  desired_count      = 2
  iam_role           = aws_iam_role.fargate.arn
  # depends_on       = [aws_iam_role_policy.foo]

  load_balancer {
    target_group_arn = aws_lb_target_group.TG.arn
    container_name   = "container"
    container_port   = 5000
  }


  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.SG.id]
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  }
}
}