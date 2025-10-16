# vérifie que la configuration active ne contient aucun cipher faible :
sshd -T | grep -Pi -- '^ciphers\h+\"?([^#\n\r]+,)?((3des|blowfish|cast128|aes(128|192|256))-cbc|arcfour(128|256)?|rijndael-cbc@lysator\.liu\.se|chacha20-poly1305@openssh\.com)\b'
# Si chacha20-poly1305@openssh.com est présent, vérifier que le système est patché contre CVE-2023-48795 :
# No ciphers in the list below should be returned as they're considered "weak":
3des-cbc
aes128-cbc
aes192-cbc
aes256-cbc
