# Ajouter la directive dans /etc/ssh/sshd_config, avant tout bloc Include ou Match :
Banner /etc/issue.net

# Créer ou modifier le fichier /etc/issue.net avec un message conforme à ta politique :
printf '%s\n' "Authorized users only. All activity may be monitored and reported." > /etc/issue.net

# Supprimer toute référence à l’OS ou aux variables système (\m, \r, \s, \v) dans ce fichier.

# Recharger la configuration SSH :
sudo systemctl reload sshd
