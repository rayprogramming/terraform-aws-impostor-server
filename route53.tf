resource "aws_route53_record" "matchmaker" {
  zone_id = var.zone_id
  name = "among"
  type = "A"

  alias {
    name = aws_lb.match.dns_name
    zone_id = aws_lb.match.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "gameserver" {
  zone_id = var.zone_id
  name = "amongus"
  type = "A"

  alias {
    name = aws_lb.game.dns_name
    zone_id = aws_lb.game.zone_id
    evaluate_target_health = true
  }
}