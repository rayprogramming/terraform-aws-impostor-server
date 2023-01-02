module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = data.aws_route53_zone.zone.name

  records = [
    {
      name    = local.matchmaker_record
      type    = "A"
      alias   = {
        name    = aws_lb.match.dns_name
        zone_id = aws_lb.match.zone_id
      }
    },
    {
      name    = local.gameserver_record
      type    = "A"
      alias = {
        name    = aws_lb.game.dns_name
        zone_id = aws_lb.game.zone_id
    }
    },
  ]
}