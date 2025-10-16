# la directive GSSAPIAuthentication est bien désactivée dans la configuration SSH :
sshd -T | grep gssapiauthentication
# Résultat attendu :
gssapiauthentication no

# Si des blocs Match sont utilisés, vérifier la configuration effective pour un utilisateur donné :
sshd -T -C user=sshuser | grep gssapiauthentication
