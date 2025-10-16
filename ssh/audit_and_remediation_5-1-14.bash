----- Audit -----
# Que la directive LogLevel est définie sur INFO ou VERBOSE :
sshd -T | grep loglevel
# résultat attendu :
loglevel INFO
# ou
loglevel VERBOSE

----- Remédiation -----
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
LogLevel VERBOSE

sudo systemctl reload sshd
