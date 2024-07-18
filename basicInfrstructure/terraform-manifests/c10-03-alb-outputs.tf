# ALB outputs

# Load balancer
output "id" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.id
}

output "arn" {
  description = "The ARN of the load balancer"
  value       = module.alb.arn
}

output "lb_https_listener_arn" {
  value = aws_lb_listener.https_listener.arn
}

output "lb_http_listener_arn" {
  value = aws_lb_listener.http_listener.arn
}

output lb_dns_name {
  description = "The DNS name of the load balancer"
  value       = module.alb.dns_name
}

output "lb_zone_id" { 
  description = "The zone ID of the load balancer"
  value       = module.alb.zone_id  
}

# Listener 
output "listeners" {
  description = "Map of listeners created and their attributes"
  value       = module.alb.listeners
  sensitive   = true
}

# Target group 
output "target_groups" {
  description = "Map of target groups created and their attributes"
  value       = module.alb.target_groups
}