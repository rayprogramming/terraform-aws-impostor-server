resource "aws_lb" "match" {
  name                       = "amongus-matchmaker"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.amongus_lb.id]
  subnets                    = var.matchmaker_subnets
  enable_deletion_protection = false

  # access_logs { // TODO(rihoj) add access logs
  #   bucket = aws_
  # }

}

resource "aws_lb" "game" {
  name                       = "amongus-game"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = var.gameserver_subnets
  enable_deletion_protection = false
}