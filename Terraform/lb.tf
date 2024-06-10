
# create load balancer (requires-- target group + target group attachment with instances + listner)

resource "aws_lb" "lb" {
  name               = "LB-T"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]


  tags = {
    Name = "web"
  }
}
#  create target group of load banacer 

resource "aws_lb_target_group" "lb_tg" {
  name     = "tf-lb-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.vpc.id

}

#  listner

resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}

# security group for the load balancer:
resource "aws_security_group" "load_balancer_security_group" {

   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Allow traffic in from all sources
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }


  tags = {
    Name = "load balancer security group "
  }
}

# To access the ECS service over HTTP while ensuring the VPC is more secure, 
# create security groups that will only allow the traffic from the created load balancer.

resource "aws_security_group" "service_security_group" {

   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    security_groups  = aws_security_group.load_balancer_security_group.id
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = " Service security group "
  }
}