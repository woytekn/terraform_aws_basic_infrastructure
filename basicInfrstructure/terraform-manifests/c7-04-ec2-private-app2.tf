module "ec2_private_instance_app2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  depends_on = [ module.vpc ]

  for_each = local.multiple_instances_app2

  name = "${var.environment}-private-instance-${each.key}"

  ami = data.aws_ami.amazon_linux.id
  instance_type = each.value.instance_type
  user_data = each.value.user_data
  key_name = each.value.key_name
  subnet_id = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  root_block_device  = lookup(each.value, "root_block_device", [])
  enable_volume_tags = false

  tags = local.common_tags

}