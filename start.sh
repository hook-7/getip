# apt-get update && apt-get install -y curl lsb-release gnupg ca-certificates nginx

# curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

# echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

# apt-get update

# apt-get install -y cloudflare-warp

nohup warp-svc &

warp-cli register 

warp-cli set-mode proxy

warp-cli connect
