
resource "aws_ecs_service" "ecs_service" {
  name               = "nodejs_hello_world"
  cluster            = aws_ecs_cluster.cluster.id
  platform_version   = "LATEST"
  launch_type        = "FARGATE"
  task_definition    = aws_ecs_task_definition.ecs_task.arn
  desired_count      = 2
  #  depends_on       = [aws_iam_role_policy.foo]

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_tg.arn
    container_name   = aws_ecs_task_definition.ecs_task.family
    container_port   = 3000
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.service_security_group.id]
    subnets          = [aws_default_subnet.default_subnet_a.id, aws_default_subnet.default_subnet_b.id]
  }
}