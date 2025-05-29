resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.instance_tag
  }

  provisioner "remote-exec" {
   inline = [
  "sudo apt-get update",
  "sudo apt-get install -y ca-certificates curl gnupg lsb-release",
  "sudo mkdir -p /etc/apt/keyrings",
  "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
  "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
  "sudo apt-get update",
  "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin",
  "sudo usermod -aG docker ubuntu",
  "mkdir -p ~/jenkins && cd ~/jenkins",
  "cat <<EOF > docker-compose.yml\nversion: '3'\nservices:\n  jenkins:\n    image: jenkins/jenkins:lts\n    ports:\n      - \"8080:8080\"\n      - \"50000:50000\"\n    volumes:\n      - jenkins_home:/var/jenkins_home\nvolumes:\n  jenkins_home:\nEOF",
  "sudo docker compose up -d"
]



    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = var.private_key_pem
      host        = self.public_ip
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

