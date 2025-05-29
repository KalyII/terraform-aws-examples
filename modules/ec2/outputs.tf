output "public_ip" {
  description = "IP publique de l'instance EC2 Jenkins"
  value       = aws_instance.jenkins.public_ip
}
output "instance_id" {
  value = aws_instance.jenkins.id
}
