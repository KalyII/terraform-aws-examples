
module "network" {
  source = "../modules/network"
}

module "key_pair" {
  source = "../modules/key_pair"
}

module "security_group" {
  source  = "../modules/security_group"
  vpc_id  = module.network.vpc_id
}


module "ec2" {
  source             = "../modules/ec2"
  instance_type      = var.instance_type
  volume_size        = var.volume_size
  key_name           = module.key_pair.key_name
  subnet_id          = module.network.subnet_id
  security_group_id  = module.security_group.security_group_id
  instance_tag       = var.instance_tag
  private_key_pem    = module.key_pair.private_key_pem
}


module "eip" {
  source      = "../modules/elastic_ip"
  instance_id = module.ec2.instance_id
}

resource "local_file" "jenkins_info" {
  content  = <<EOT
Jenkins IP: ${module.ec2.public_ip}
Nom de domaine: jenkins.example.com
EOT
  filename = "${path.module}/../jenkins_ec2.txt"
}
