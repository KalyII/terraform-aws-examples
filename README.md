# 🚀 Déploiement Automatisé de Jenkins sur AWS avec Terraform

Ce projet a pour objectif de provisionner automatiquement une instance **EC2 Ubuntu** sur AWS avec **Jenkins conteneurisé via Docker Compose**, en utilisant une architecture **modulaire en Terraform**.

---

## 📦 Contenu du projet

Le projet est découpé en plusieurs modules Terraform réutilisables :

| Module          | Description |
|-----------------|-------------|
| `key_pair`      | Génère dynamiquement une paire de clés SSH |
| `security_group`| Ouvre les ports 22, 80, 443, 8080 |
| `ec2`           | Crée l’instance EC2 et installe Jenkins (via `remote-exec`) |
| `elastic_ip`    | Attribue une IP publique fixe |
| `network`       | Crée automatiquement un VPC, subnet et route table |

---

## ⚙️ Fonctionnalités

- 🔐 Création sécurisée de clés privées via `tls_private_key`
- ☁️ Déploiement cloud sur AWS (via le provider officiel)
- 🐳 Installation de Jenkins dans un conteneur Docker
- 📝 Génération d’un fichier `jenkins_ec2.txt` avec l’adresse publique
- 📂 Code organisé et facilement réutilisable avec des variables

---

## 🧪 Prérequis

- Terraform >= 1.3
- Un compte AWS avec les droits EC2/VPC/IAM
- Une clé d’accès AWS (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, etc.)
- Docker installé (si tu testes en local)

---

## 🚀 Déploiement
terraform init
terraform validate
terraform plan
terraform apply -auto-approve


### 1. Clone le dépôt

git clone https://github.com/KalyII/terraform-aws-examples.git
cd terraform-aws-examples/app
