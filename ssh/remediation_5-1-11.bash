# Modifier le fichier /etc/ssh/sshd_config pour ajouter la directive avant tout bloc Include ou Match :
IgnoreRhosts yes

sudo systemctl reload sshd
