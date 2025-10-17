# Configuration sur serveur (en tant que root)
## Sur la CA
ssh-keygen -t ed25519 -a 100 -f ssh_users_ed25519_key
cp ssh_users_ed25519_key /etc/ssh/
scp ssh_users_ed25519_key.pub admin1@proxy.fede.company.lan:/tmp
scp ssh_users_ed25519_key.pub lade@freeipa.identity.company.lan:/tmp
## Sur le serveur (proxy)
mv /tmp/ssh_users_ed25519_key.pub /etc/ssh
nano /etc/ssh/sshd_config
    TrustedUserCAKeys /etc/ssh/ssh_users_ed25519_key.pub
systemctl reload sshd

# Configuration du client
## Sur le client (admin2)
ssh-keygen -f ~/.ssh/clientkey -C "clé client SSH" -N "password"
scp clientkey lade@freeipa.identity.company.lan:/etc/ssh
## Sur freeipa
mv /tmp/ssh_users_ed25519_key.pub /etc/ssh
ssh-keygen -s /etc/ssh/ssh_users_ed25519_key -I lade@proxy.fede.company.lan -n lade -V +365d id_ed25519.pub
scp id_ed25519.pub lade@pc-admin-2.admin.company.lan:/home/lade/.ssh/
------------------------------
# Sur la CA :
ssh-keygen -f ~/.ssh/ssh_ca -C "CA SSH" -N "password"
# Sur le client :
ssh-keygen -f ~/.ssh/clientkey -C "clé client SSH" -N "password"

# Transfert clé publique -> CA (placé sur le client)
scp ~/.ssh/clientkey.pub freeipa.identity.company.lan:/tmp/

# Signer la clé publique (sur la CA)
ssh-keygen -s ~/.ssh/ssh_ca -I user_lade -n lade -V +2w /tmp/clientkey.pub

# Sur la CA
scp /tmp/clientkey-cert.pub pc-admin-1.admin.company.lan:~/.ssh/
scp ~/.ssh/ssh_ca.pub proxy.fede.company.lan:/etc/ssh/CAKey.pub

# Sur le proxy Dans /etc/ssh/sshd_config, ajoute :
TrustedUserCAKeys /etc/ssh/CAKey.pub
systemctl restart sshd



==========================================
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
