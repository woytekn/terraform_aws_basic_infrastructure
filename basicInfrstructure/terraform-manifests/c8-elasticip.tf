# Elastic IP for Bastion Host

resource "aws_eip" "bastion_host" {
    depends_on = [ module.ec2_public_bastion_instance, module.vpc ]
    instance = module.ec2_public_bastion_instance.id[0]
    tags = local.common_tags
}