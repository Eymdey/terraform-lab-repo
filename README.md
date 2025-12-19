# TP Terraform & Ansible
Projet d'infrastructureAutomatisée - EPSI

## Structure
```
terraform/   → Déploiement IaC (VirtualBox, Proxmox, GitHub)
ansible/     → Configuration serveurs (playbooks)
```

## Déploiement Terraform

```bash
# VirtualBox (3 VMs)
cd terraform/virtualbox
terraform init && terraform apply

# Proxmox (3 VMs)
cd terraform/proxmox
terraform init && terraform apply

# GitHub (1 repo)
cd terraform/github
terraform init && terraform apply
```

## Lancement Ansible

```bash
cd ansible

# Config globale (packages de base)
ansible-playbook -i inventory/hosts.ini playbooks/global-config.yml

# Déploiement WordPress
ansible-playbook -i inventory/hosts.ini playbooks/wordpress.yml
```

## Prérequis
- Terraform >= 1.0
- Ansible >= 2.9
- VirtualBox / Proxmox / GitHub Token
