# Commande d'audit globale
sshd -T | grep -Pi -- '^\h*(allow|deny)(users|groups)\h+\H+'

# Commande d’audit ciblée (si Match est utilisé) :
sshd -T -C user=sshuser | grep -Pi -- '^\h*(allow|deny)(users|groups)\h+\H+'
