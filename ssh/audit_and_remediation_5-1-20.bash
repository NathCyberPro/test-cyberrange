----- Audit -----
# Vérifier que PermitRootLogin est bien désactivé :
sshd -T | grep permitrootlogin
# attendu
permitrootlogin no

----- Remédiation -----
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
PermitRootLogin no

sudo systemctl reload sshd
