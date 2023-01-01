resource "aws_lb_target_group" "http" {
  name     = "amongus-http-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "http" {
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = aws_instance.impostor.id
  port             = 22022
}
resource "aws_lb_target_group" "udp" {
  name     = "amongus-udp-targetgroup"
  port     = 22023
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "udp" {
  target_group_arn = aws_lb_target_group.udp.arn
  target_id        = aws_instance.impostor.id
  port             = 22023
}