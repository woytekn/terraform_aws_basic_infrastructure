output "public_bastion_sg_group_id" {
    description = "The id of the security group"
    value = module.public_bastion_sg.this_security_group_id
}

output "public_bastion_sg_vpc_id" {
    description = "The id of the VPC endpoint"
    value = module.public_bastion_sg.this_security_group_vpc_id
}

output "public_bastion_sg_name" {
    description = "The name of the security group"
    value = module.public_bastion_sg.this_security_group_name
}

output "private_sg_group_id" {
    description = "The id of the security group"
    value = module.private_sg.this_security_group_id
}

output "private_sg_vpc_id" {
    description = "The id of the VPC endpoint"
    value = module.private_sg.this_security_group_vpc_id
}

output "private_sg_name" {
    description = "The name of the security group"
    value = module.private_sg.this_security_group_name
}

  
