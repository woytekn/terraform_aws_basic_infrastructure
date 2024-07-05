module "public_bastion_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.2"

    name = "public-bastion"
    description = "Security group for public bastion host"
    vpc_id = module.vpc.vpc_id

    ingress_rules = ["ssh-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    egress_rules = ["all-all"]
    tags = local.common_tags
}
