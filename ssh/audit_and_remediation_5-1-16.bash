----- Audit -----
# Que la directive MaxAuthTries est bien définie avec une valeur inférieure ou égale à 4 :
sshd -T | grep maxauthtries
# resultat attendu
maxauthtries 4

----- Remédiation -----
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
MaxAuthTries 4

sudo systemctl reload sshd
