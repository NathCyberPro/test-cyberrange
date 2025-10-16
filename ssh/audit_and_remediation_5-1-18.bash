----- Audit -----
# Que la directive MaxStartups est définie avec des seuils égaux ou plus restrictifs que 10:30:60 :
sshd -T | awk '$1 ~ /^\s*maxstartups/{split($2, a, ":");{if(a[1] > 10 || a[2] > 30 || a[3] > 60) print $0}}'
# Si aucune ligne n’est retournée, c’est conforme.

----- Remédiation -----
# Modifier le fichier /etc/ssh/sshd_config pour ajouter ou corriger la directive avant tout bloc Include ou Match :
MaxStartups 10:30:60
# 10 : nombre de connexions non authentifiées autorisées avant de commencer à les rejeter de manière probabiliste
# 30 : pourcentage de probabilité de rejet au-delà du seuil
# 60 : nombre maximal absolu de connexions non authentifiées

sudo systemctl reload sshd
