output "jenkins_public_ip" {
  description = "IP publique retournée par le module EC2"
  value       = module.ec2.public_ip
}
