# Modifier le fichier /etc/ssh/sshd_config pour définir les deux paramètres avant tout bloc Include ou Match :
ClientAliveInterval 15
ClientAliveCountMax 3
# Cela provoque la déconnexion d’un client SSH non réactif après environ 45 secondes.
sudo systemctl reload sshd
