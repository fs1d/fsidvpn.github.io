#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
#GREEN='\033[0;32m'
#ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
#CYAN='\033[0;36m'
LIGHT='\033[0;37m'
off='\x1b[m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
clear
apt install jq curl -y
DOMAIN=fsidvpn.tech
sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
SUB_DOMAIN=${sub}.fsidvpn.tech
CF_ID=awaledyan@gmail.com
CF_KEY=f135a7d4852d3e25779471c8426f11d72faa9
set -euo pipefail
IP=$(curl -s6m8 https://ip.gs);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"AAAA","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":true}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"AAAA","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":true}')
echo "Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
# / / Make Main Directory
mkdir -p /usr/bin/xray
mkdir -p /etc/xray
cp /root/domain /etc/xray
rm -f /root/cf.sh
