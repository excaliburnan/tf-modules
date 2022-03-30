
variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "webserver_amis" {
  type = map
}

variable "public_key" {
}

variable "private_key" {
}