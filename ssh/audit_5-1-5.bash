# Que la directive Banner est bien définie dans la configuration SSH :
sshd -T | grep -Pi -- '^banner\h+\/\H+'
# Si des blocs Match sont utilisés, vérifier que la bannière est bien appliquée :
sshd -T -C user=sshuser | grep -Pi -- '^banner\h+\/\H+'
# Vérifier que le fichier de bannière existe et contient un message conforme à la politique du site :
[ -e "$(sshd -T | awk '$1 == "banner" {print $2}')" ] && cat "$(sshd -T | awk '$1 == "banner" {print $2}')"
# Vérifier qu’il ne contient pas de variables système ou d’identifiants OS (\m, \r, \s, \v, etc.) :
grep -Psi -- "(\\\v|\\\r|\\\m|\\\s|\b$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/\"//g')\b)" "$(sshd -T | awk '$1 == "banner" {print $2}')"

