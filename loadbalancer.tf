resource "aws_lb" "match" {
    name = "amongus-matchmaker"
    internal = false
    load_balancer_type = "application"
    security_groups = ["amongus"] // TODO(rihoj) make resource
    subnets = [] // TODO(rihoj) make resources
    enable_deletion_protection = true

    # access_logs { // TODO(rihoj) add access logs
    #   bucket = aws_
    # }

}