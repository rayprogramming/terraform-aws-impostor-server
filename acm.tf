module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = local.matchmaker_fqdn
  zone_id      = var.zone_id

  wait_for_validation = true
  depends_on = [
    module.records
  ]
}