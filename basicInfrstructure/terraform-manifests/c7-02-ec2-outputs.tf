# Public bastion instance outputs
output "public_bastion_instance_id" {
    description = "EC2 Instance id"
    value = module.ec2_public_bastion_instance.id
}

output "ec2_bastion_public_ip" {
    description = "Public Ip address EC2 instance"
    value = module.ec2_public_bastion_instance.public_ip
}

# Private instances outputs
output "ec2_private_app1_instances_ids" {
description = "List of IDs of private instances"
value = [for instance in module.ec2_private_instance_app1: instance.id]
}

output "ec2_private_app1_private_ip" {
    description = "List of private IP addresses aassignet to the instances"
      value       = [for instance in module.ec2_private_instance_app1 : instance.private_ip]
}

output "ec2_private_app2_instances_ids" {
description = "List of IDs of private instances"
value = [for instance in module.ec2_private_instance_app2: instance.id]
}

output "ec2_private_app2_instance_private_ip" {
    description = "List of private IP addresses aassignet to the instances"
      value       = [for instance in module.ec2_private_instance_app2 : instance.private_ip]
}