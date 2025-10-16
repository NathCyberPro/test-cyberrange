----- Sur la machine CA (ex. admin1) -----
# Générer la clé de l'autorité
ssh-keygen -f /etc/ssh/ssh_ca -N "" -C "SSH CA"

# Afficher la clé publique de la CA
cat /etc/ssh/ssh_ca.pub

----- Sur les deux machines d’administration (admin1, admin2) -----
# Générer une paire de clés utilisateur
ssh-keygen -f ~/.ssh/id_lade -N "" -C "lade@proxy"

# Signer la clé publique avec la CA
ssh-keygen -s /etc/ssh/ssh_ca -I lade-cert -n lade -V +52w ~/.ssh/id_lade.pub

# → Cela crée id_lade-cert.pub, le certificat signé.

----- Sur proxy.fede.company.lan -----
# Copier la clé publique de la CA
cat /etc/ssh/ssh_ca.pub >> /etc/ssh/trusted_user_ca_keys.pub

# Modifier la configuration SSH
echo "TrustedUserCAKeys /etc/ssh/trusted_user_ca_keys.pub" >> /etc/ssh/sshd_config
echo "AuthorizedPrincipalsFile /etc/ssh/authorized_principals/%u" >> /etc/ssh/sshd_config

# Créer le fichier de principals
mkdir -p /etc/ssh/authorized_principals
echo "lade" > /etc/ssh/authorized_principals/lade

# Redémarrer le service SSH
systemctl restart sshd

----- Sur les machines d’administration -----
# Ajouter le certificat au fichier d'identité
cat ~/.ssh/id_lade-cert.pub >> ~/.ssh/authorized_keys

# Connexion
ssh -i ~/.ssh/id_lade lade@proxy.fede.company.lan
