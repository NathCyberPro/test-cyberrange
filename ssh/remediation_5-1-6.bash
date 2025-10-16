# Modifier le fichier /etc/ssh/sshd_config pour exclure explicitement les ciphers faibles :
# → Cette directive doit être placée avant tout bloc Include.
Ciphers -3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,chacha20-poly1305@openssh.com

# Si ton système est patché contre CVE-2023-48795 et que ta politique le permet, tu peux retirer chacha20-poly1305@openssh.com de la liste d’exclusion.
sudo systemctl reload sshd
