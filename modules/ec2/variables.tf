variable "instance_type" {}
variable "volume_size" {}
variable "key_name" {}
variable "subnet_id" {}

variable "security_group_id" {
  description = "ID du security group à attacher à l'instance EC2"
  type        = string
}

variable "instance_tag" {}

variable "private_key_pem" {
  description = "Contenu de la clé privée"
}
