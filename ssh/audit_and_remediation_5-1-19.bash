# Vérifier que PermitEmptyPasswords est bien désactivé :
sshd -T | grep permitemptypasswords
# Résultat attendu :
permitemptypasswords no

# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
PermitEmptyPasswords no

sudo systemctl reload sshd
