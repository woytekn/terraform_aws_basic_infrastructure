# Public Bastion Security Group id
output "public_bastion_sg_group_id" {
    description = "The id of the security group"
    value = module.public_bastion_sg.security_group_id
}

# Public Bastion Security Group VPC id
output "public_bastion_sg_vpc_id" {
    description = "The id of the VPC endpoint"
    value = module.public_bastion_sg.security_group_vpc_id
}

# Public Bastion Security Group name
output "public_bastion_sg_name" {
    description = "The name of the security group"
    value = module.public_bastion_sg.security_group_name
}

# Private Security Group id
output "private_sg_group_id" {
    description = "The id of the security group"
    value = module.private_sg.security_group_id
}

# Private Security Group VPC id
output "private_sg_vpc_id" {
    description = "The id of the VPC endpoint"
    value = module.private_sg.security_group_vpc_id
}

# Private Security Group name
output "private_sg_name" {
    description = "The name of the security group"
    value = module.private_sg.security_group_name
}

  
