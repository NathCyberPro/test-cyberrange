----- Audit ------
# Vérifier que PermitUserEnvironment est bien désactivé :
sshd -T | grep permituserenvironment
# attendu
permituserenvironment no

----- Remédiation -----
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
PermitUserEnvironment no

sudo systemctl reload sshd
