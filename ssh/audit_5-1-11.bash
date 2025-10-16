# Que la directive IgnoreRhosts est bien activée :
sshd -T | grep ignorerhosts
# attendu
ignorerhosts yes

