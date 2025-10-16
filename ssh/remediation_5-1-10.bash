# Modifier le fichier /etc/ssh/sshd_config pour ajouter la directive avant tout bloc Include ou Match :
HostbasedAuthentication no

sudo systemctl reload sshd
