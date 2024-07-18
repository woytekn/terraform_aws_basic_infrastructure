# ACM module to create a certificate for the domain
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.0.1"

  domain_name = var.my_domain
  zone_id     = data.aws_route53_zone.mydomain.zone_id

  subject_alternative_names = ["*.${var.my_domain}"]

  validation_method = "DNS"

tags = local.common_tags
}

# Output ACM Certificate ARN
output "acm_certificate_arn" {
  value = module.acm.acm_certificate_arn
}