locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }

 multiple_instances_app1 = {
    one = {
      instance_type     = var.instance_type
      user_data = file("${path.module}/app1-install.sh")
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.private_subnets, 0)
      key_name = var.instance_keypair
      vpc_security_group_ids = [module.private_sg.security_group_id]
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp3"
          volume_size = 8
        }
      ]
    }
    two = {
      instance_type     = var.instance_type
      user_data = file("${path.module}/app1-install.sh")
      availability_zone = element(module.vpc.azs, 1)
      subnet_id         = element(module.vpc.private_subnets, 1)
      key_name = var.instance_keypair
      vpc_security_group_ids = [module.private_sg.security_group_id]
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp3"
          volume_size = 8
        }
      ]
    }
  }

  multiple_instances_app2 = {
    one = {
      instance_type     = var.instance_type
      user_data = file("${path.module}/app2-install.sh")
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.private_subnets, 0)
      key_name = var.instance_keypair
      vpc_security_group_ids = [module.private_sg.security_group_id]
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp3"
          volume_size = 8
        }
      ]
    }
    two = {
      instance_type     = var.instance_type
      user_data = file("${path.module}/app1-install.sh")
      availability_zone = element(module.vpc.azs, 1)
      subnet_id         = element(module.vpc.private_subnets, 1)
      key_name = var.instance_keypair
      vpc_security_group_ids = [module.private_sg.security_group_id]
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp3"
          volume_size = 8
        }
      ]
    }
  }
}
