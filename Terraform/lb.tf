
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

resource "aws_lb_target_group" "lb-tg" {
  name     = "tf-lb-tg"
  port     = 3000
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.vpc.id

}

#  listner

resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "TCP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}