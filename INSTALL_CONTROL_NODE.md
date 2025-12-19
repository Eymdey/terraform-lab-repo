# INSTALLATION CONTROL NODE LINUX MINT
*VM pour exécuter Ansible - Conforme au TP*

---

## ÉTAPE 1 : Télécharger Linux Mint

1. Aller sur : https://linuxmint.com/download.php
2. Télécharger **Linux Mint 21.3 Cinnamon** (ISO ~2.8 GB)
3. Sauvegarder dans `C:\Users\Dorian\Downloads\`

---

## ÉTAPE 2 : Créer la VM dans VirtualBox

1. Ouvrir **VirtualBox**
2. Cliquer **Nouvelle**
3. Configuration :
   - Nom : `control-node`
   - Type : Linux
   - Version : Ubuntu (64-bit)
   - RAM : 4096 MB
   - Disque : 25 GB (dynamique)
4. Cliquer **Créer**

---

## ÉTAPE 3 : Monter l'ISO

1. Sélectionner la VM `control-node`
2. **Configuration** > **Stockage**
3. Cliquer sur le CD vide
4. À droite, cliquer l'icône CD > **Choisir un fichier**
5. Sélectionner l'ISO Linux Mint téléchargé
6. **OK**

---

## ÉTAPE 4 : Configuration Réseau

1. **Configuration** > **Réseau**
2. Adaptateur 1 :
   - Cocher : Activer la carte réseau
   - Mode : **Accès par pont**
   - Nom : Intel(R) Wi-Fi 6 AX201 160MHz
3. **OK**

---

## ÉTAPE 5 : Démarrer et Installer

1. **Démarrer** la VM
2. Choisir **Start Linux Mint**
3. Double-cliquer **Install Linux Mint** sur le bureau
4. Suivre l'assistant :
   - Langue : Français
   - Clavier : Français
   - Installer les codecs : Oui
   - Effacer le disque : Oui
   - Utilisateur : `ansible` / Mot de passe : `ansible`
5. Redémarrer après installation

---

## ÉTAPE 6 : Installer Ansible

Ouvrir un terminal dans Linux Mint :

```bash
# Mise à jour
sudo apt update && sudo apt upgrade -y

# Installation Ansible + outils
sudo apt install -y ansible sshpass git

# Vérification
ansible --version
```

---

## ÉTAPE 7 : Cloner ton projet

```bash
cd ~
git clone https://github.com/Eymdey/terraform-lab-repo.git
cd terraform-lab-repo
git checkout final-submission
```

---

## ÉTAPE 8 : Configurer SSH

```bash
# Générer clé SSH
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

# Copier sur les managed nodes (remplacer les IPs)
ssh-copy-id root@<IP_DEBIAN_1>
ssh-copy-id root@<IP_DEBIAN_2>
```

---

## ÉTAPE 9 : Test Ansible ⭐

```bash
cd ~/terraform-lab-repo/ansible
ansible all -m ping -u root -i inventory/hosts.ini
```

**Résultat attendu :**
```
debian-server-1 | SUCCESS => { "ping": "pong" }
debian-server-2 | SUCCESS => { "ping": "pong" }
```

---

## ÉTAPE 10 : Lancer les Playbooks ⭐

```bash
# Config générale
ansible-playbook -i inventory/hosts.ini playbooks/global-config.yml

# WordPress
ansible-playbook -i inventory/hosts.ini playbooks/wordpress.yml
```

---

## TEMPS ESTIMÉ

| Étape | Durée |
|-------|-------|
| Téléchargement ISO | 10-15 min |
| Création VM | 2 min |
| Installation Linux Mint | 15-20 min |
| Configuration Ansible | 5 min |
| **TOTAL** | ~35-45 min |
