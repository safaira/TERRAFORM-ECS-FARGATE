
# TO GET THE LB DNS NAME ON TERMINAL

output "loadbalancerdns" {
  value = aws_lb.lb.dns_name
}