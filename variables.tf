variable "private_key" {
  type        = string
  description = "The location of the private key file used to connect to the instance"
}

variable "zone_id" {
  type = string
  description = "The Route53 zone"
}