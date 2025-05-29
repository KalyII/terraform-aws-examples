variable "size" {
  type    = number
  default = 100
}

variable "AZ" {
  type    = string
  default = "us-east-1b"
}

variable "vpc_id" {
  description = "ID du VPC dans lequel créer le security group"
  type        = string
}
