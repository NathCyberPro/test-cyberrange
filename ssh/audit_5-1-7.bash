# Que les deux paramètres sont bien définis et ont des valeurs strictement supérieures à zéro :
sshd -T | grep -Pi -- '(clientaliveinterval|clientalivecountmax)'

# exemple attendu
clientaliveinterval 15
clientalivecountmax 3
