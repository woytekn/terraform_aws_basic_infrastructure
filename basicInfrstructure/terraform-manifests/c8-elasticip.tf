# Elastic IP for Bastion Host

resource "aws_eip" "bastion_host" {
    depends_on = [ module.ec2_public_bastion_instance, module.vpc ]
    instance = module.ec2_public_bastion_instance.id
    domain = "vpc"
    tags = local.common_tags
}