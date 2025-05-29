variable "instance_type" {
  description = "Type d'instance EC2"
}

variable "volume_size" {
  description = "Taille du disque racine de l'EC2"
}

variable "subnet_id" {
  description = "Subnet ID dans lequel déployer l'EC2"
}

variable "instance_tag" {
  description = "Nom ou tag de l'instance"
}
