----- Audit -----
# Que la directive MaxSessions est bien définie avec une valeur inférieure ou égale à 10 :
sshd -T | grep -i maxsessions
# attendu
maxsessions 10
# Que la configuration ne contient aucune valeur supérieure à 10 :
grep -Psi -- '^\h*MaxSessions\h+\"?(1[1-9]|[2-9][0-9]|[1-9][0-9][0-9]+)\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf

----- Remédiation -----
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
MaxSessions 10

sudo systemctl reload sshd
