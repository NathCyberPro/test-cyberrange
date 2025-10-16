----- Audit -----
# Vérifier que UsePAM est bien activé :
sshd -T | grep -i usepam
# resultat attendu
usepam yes

----- Remédiation ------
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
UsePAM yes

sudo systemctl reload sshd
