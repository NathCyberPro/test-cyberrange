# verif que la directive DisableForwarding est bien activée dans la configuration SSH :
sshd -T | grep -i disableforwarding
# resultat attendu
disableforwarding yes
