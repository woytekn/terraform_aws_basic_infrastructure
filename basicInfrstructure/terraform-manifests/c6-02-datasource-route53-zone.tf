# Get DNS information for my domain from Route53
data "aws_route53_zone" "mydomain" {
  name = var.my_domain
}

# Output My Domain Zone ID
output "my_domain_zone_id" {
  value = data.aws_route53_zone.mydomain.zone_id
}

output "mydomain_name" {
  description = "The hosted zone name of the desired hosted zone"
  value = data.aws_route53_zone.mydomain.name
}