resource "tls_private_key" "jenkins_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_key_pair" "jenkins_key" {
  key_name   = "vockey1-${random_id.suffix.hex}"
  public_key = tls_private_key.jenkins_key.public_key_openssh
}

resource "local_file" "private_key" {
  content              = tls_private_key.jenkins_key.private_key_pem
  filename             = "${path.module}/vockey1.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}
