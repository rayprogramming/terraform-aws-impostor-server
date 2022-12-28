resource "aws_security_group" "amongus_instance" {
  name        = "amongus_instance"
  description = "Security Group for the amongus instance"
  vpc_id      = var.instance_subnet.vpc_id
}

resource "aws_security_group_rule" "amongus_instance_http" {
  type              = "ingress"
  from_port         = 22023
  to_port           = 22023
  protocol          = "tcp"
  security_group_id = "sg-0e14272498b528df4" // Change to amongus db
}

resource "aws_security_group_rule" "amongus_instance_udp" {
  type        = "ingress"
  from_port   = 22022
  to_port     = 22022
  protocol    = "udp"
  cidr_blocks = ["0.0.0.0/0"]
}