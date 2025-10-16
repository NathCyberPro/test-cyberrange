# Modifier le fichier /etc/ssh/sshd_config pour ajouter la directive avant tout bloc Include :
DisableForwarding yes

sudo systemctl reload sshd
