# ALB outputs

# Load balancer
output "id" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.id
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