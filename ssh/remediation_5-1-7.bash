# Modifier le fichier /etc/ssh/sshd_config pour définir les deux paramètres avant tout bloc Include ou Match :
ClientAliveInterval 15
ClientAliveCountMax 3

sudo systemctl reload sshd
