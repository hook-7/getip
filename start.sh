service apache2 stop
apt-get purge apache2 apache2-utils apache2-bin
rm -rf /etc/apache2
apt-get autoremove

apt-get update && apt-get install -y curl lsb-release gnupg ca-certificates nginx

curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

apt-get update

apt-get install -y cloudflare-warp

bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)

cp ./db/x-ui.db /etc/x-ui/x-ui.db
cp ./nginx.conf /etc/nginx/nginx.conf


# nohup warp-svc &
# sleep 10

# warp-cli register 

# warp-cli set-mode proxy

# warp-cli connect
