----- Audit -----
# Que la directive LoginGraceTime est bien définie avec une valeur entre 1 et 60 secondes :
sshd -T | grep logingracetime
# attendu
logingracetime 60

----- Remédiation ------
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
LoginGraceTime 60

sudo systemctl reload sshd
