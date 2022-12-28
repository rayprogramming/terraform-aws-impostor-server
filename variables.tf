variable "private_key" {
  type        = string
  description = "The location of the private key file used to connect to the instance"
}

variable "zone_id" {
  type        = string
  description = "The Route53 zone"
}

variable "matchmaker_subnets" {
  type = list(object({
    id                = string
    arn               = string
    vpc_id            = string
    availability_zone = string
  }))
  description = "List of subnet objects for the match maker alb"
}

variable "gameserver_subnets" {
  type = list(object({
    id                = string
    arn               = string
    vpc_id            = string
    availability_zone = string
  }))
  description = "List of subnet objects for the gameserver nlb"
}

variable "instance_subnet" {
  type = object({
    id                = string
    arn               = string
    vpc_id            = string
    availability_zone = string
  })
  description = "Subnet object for the gameserver instance"
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