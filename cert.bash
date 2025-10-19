# sur client
scp admin1@freeipa.identity.company.lan:/tmp/ca.crt /tmp
mv /tmp/ca.crt /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates
