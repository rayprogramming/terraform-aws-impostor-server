resource "aws_security_group" "amongus_instance" {
  name        = "amongus_instance"
  description = "Security Group for the amongus instance"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "amongus_instance_http" {
  type              = "ingress"
  from_port         = 22023
  to_port           = 22023
  protocol          = "tcp"
  security_group_id = aws_security_group.amongus_instance.id
}

resource "aws_security_group_rule" "amongus_instance_udp" {
  type              = "ingress"
  from_port         = 22022
  to_port           = 22022
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.amongus_instance.id
}

resource "aws_security_group" "amongus_lb" {
  name        = "amongus_lb"
  description = "Security Group for the among us instance"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "amongus_lb_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.amongus_lb.id
}
resource "aws_security_group_rule" "amongus_lb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.amongus_lb.id
}