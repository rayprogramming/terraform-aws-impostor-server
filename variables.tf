variable "private_key" {
  type        = string
  description = "The location of the private key file used to connect to the instance"
}

variable "zone_id" {
  type        = string
  description = "The Route53 zone"
}

variable "vpc_id" {
  type        = string
  description = "The id of the VPC"
}

variable "matchmaker_subnets" {
  type        = list(string)
  description = "List of subnet IDs for the match maker alb"
}

variable "gameserver_subnets" {
  type        = list(string)
  description = "List of subnet IDs for the gameserver nlb"
}

variable "instance_subnet" {
  type        = string
  description = "Subnet ID for the gameserver instance"
}

variable "instance_availability_zone" {
  type        = string
  description = "Availability Zone for the gameserver instance"
}

variable "instance_type" {
  type        = string
  default     = "t3a.micro"
  description = "The size of the server"
}

variable "instance_key_name" {
  type        = string
  description = "The AWS Keyname for an instance"
}

locals {
  matchmaker_record = "au-matchmaker"
  matchmaker_domain = data.aws_route53_zone.zone.name
  matchmaker_fqdn = "${local.matchmaker_record}.${local.matchmaker_domain}"
  gameserver_record = "au-gameserver"
  gameserver_domain = data.aws_route53_zone.zone.name
  gameserver_fqdn = "${local.gameserver_record}.${local.gameserver_domain}"
}