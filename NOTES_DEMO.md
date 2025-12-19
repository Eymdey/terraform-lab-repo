# 🎓 TUTO COMPLET - TP TERRAFORM & ANSIBLE
*Guide personnel pour la démo*

---

## ARCHITECTURE FINALE

```
┌─────────────────────┐
│   CONTROL NODE      │  IP: 10.10.10.6
│   Linux Mint        │  User: ansible
│   + Ansible         │
└─────────┬───────────┘
          │ SSH (clé)
    ┌─────┴─────┐
    ▼           ▼
┌─────────┐ ┌─────────┐
│debian-1 │ │debian-2 │
│10.10.10.7│ │10.10.10.5│
│ FRONT   │ │ BACK    │
│WordPress│ │ (BDD)   │
└─────────┘ └─────────┘
```

---

## DÉMARRAGE RAPIDE (5 min)

### 1. Allumer les VMs
Dans VirtualBox, démarrer :
- `control-node` (Linux Mint)
- `debian-server-1`
- `debian-server-2`

### 2. Se connecter au control-node
Login: `ansible` / Password: `ansible`

### 3. Aller dans le projet
```bash
cd ~/terraform-lab-repo/ansible
```

### 4. Test ping
```bash
ansible all -m ping -u root -i inventory/hosts.ini
```

**Résultat attendu :**
```
localhost | SUCCESS
debian-server-1 | SUCCESS
debian-server-2 | SUCCESS
```

---

## COMMANDES DÉMO COMPLÈTES

### Terraform (sur Windows)

```powershell
# VirtualBox
cd terraform/virtualbox
terraform init
terraform plan

# Proxmox
cd ../proxmox
terraform init
terraform plan

# GitHub
cd ../github
terraform init
terraform plan
```

### Ansible (sur Linux Mint)

```bash
cd ~/terraform-lab-repo/ansible

# Ping
ansible all -m ping -u root -i inventory/hosts.ini

# Playbook global (7 packages)
ansible-playbook -i inventory/hosts.ini playbooks/global-config.yml

# Playbook WordPress
ansible-playbook -i inventory/hosts.ini playbooks/wordpress.yml

# Vérifier installation
ansible managed -m shell -a "dpkg -l | grep vim" -i inventory/hosts.ini
```

---

## CONFIGURATION RÉSEAU

Toutes les VMs sont sur le réseau **NAT Network** `LabNetwork` (10.10.10.0/24)

| VM | IP | Rôle |
|----|-----|------|
| control-node | 10.10.10.6 | Ansible |
| debian-server-1 | 10.10.10.7 | Front/WordPress |
| debian-server-2 | 10.10.10.5 | Back/Database |

---

## ACCÈS WORDPRESS

Depuis Linux Mint :
```
http://10.10.10.7/wordpress/
```

Credentials BDD :
- Base : `wordpress_db`
- User : `wp_user`
- Pass : `WpSecurePass123`

---

## SI PROBLÈME DE RÉSEAU

```bash
# Sur chaque VM Debian
su -
dhclient enp0s3
ip a
```

---

## CONTENU DES PLAYBOOKS

### global-config.yml
Installe : vim, net-tools, curl, wget, git, fail2ban, rsync

### wordpress.yml
Installe : Apache, MariaDB, PHP, WordPress (sur groupe `front`)

### specialisation.yml
Configure MOTD selon le rôle (front/back)

---

## APPELS PROFESSEUR

| # | Sujet | Commande de preuve |
|---|-------|-------------------|
| 1 | VirtualBox 3 VMs | `terraform plan` |
| 2 | Proxmox 3 VMs | `terraform plan` |
| 3 | GitHub repo | `terraform plan` |
| 4 | Ping Ansible | `ansible all -m ping` |
| 5 | Playbooks | Exécution sans erreur |
