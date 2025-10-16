# verif la directive HostbasedAuthentication est bien désactivée :
sshd -T | grep hostbasedauthentication
# resultat attendu
hostbasedauthentication no

# Si des blocs Match sont utilisés, vérifier la configuration effective pour un utilisateur donné :
sshd -T -C user=sshuser | grep hostbasedauthentication
