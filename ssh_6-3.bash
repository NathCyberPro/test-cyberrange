# Modifier /etc/ssh/sshd_config
AllowGroups usergroup_admin
UsePAM yes
GSSAPIAuthentication yes

# Dans /etc/pam.d/sshd, tu dois avoir :
session required pam_mkhomedir.so skel=/etc/skel umask=0077
# -> Si absent, ajoute-le juste après les lignes session existantes.

