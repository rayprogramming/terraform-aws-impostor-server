resource "aws_lb_listener" "http_443" {
  load_balancer_arn = aws_lb.match.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = "" // TODO(rihoj) make resource
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_listener" "http_80" {
  load_balancer_arn = aws_lb.match.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port = "433"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "udp_22022" {
  load_balancer_arn = aws_lb.game.arn
  port = "22022"
  protocol = "UDP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.udp.arn
  }
}