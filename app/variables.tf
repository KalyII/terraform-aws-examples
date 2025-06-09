# === Authentification AWS ===
variable "aws_region" {
  description = "Région AWS à utiliser"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "Clé d'accès AWS (Access Key ID)"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "Clé secrète AWS (Secret Access Key)"
  type        = string
  sensitive   = true
}

variable "aws_session_token" {
  description = "Token de session temporaire AWS (facultatif)"
  type        = string
  sensitive   = true
  default     = ""
}

# === Variables EC2 ===
variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
}

variable "volume_size" {
  description = "Taille du disque racine de l'EC2"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID dans lequel déployer l'EC2"
  type        = string
}

variable "instance_tag" {
  description = "Nom ou tag de l'instance"
  type        = string
}
