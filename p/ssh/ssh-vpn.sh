#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
off='\x1b[m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/fsidvpn/perizinan/main/main/allow > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipinfo.io/ip)
Name=$(curl -sS https://raw.githubusercontent.com/fsidvpn/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipinfo.io/ip)
    IZIN=$(curl -sS https://raw.githubusercontent.com/fsidvpn/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi

# ==================================================
# Link Hosting Kalian
akbarvpn="autosc.me/p/ssh"

# Link Hosting Kalian Untuk Xray
akbarvpnn="autosc.me/p/xray"

# Link Hosting Kalian Untuk Trojan Go
akbarvpnnn="autosc.me/p/trojango"

# Link Hosting Kalian Untuk Stunnel5
akbarvpnnnn="autosc.me/p/stunnel5"

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=fsidvpn
organizationalunit=fsidvpn
commonname=fsidvpn
email=awaledyan@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://${akbarvpn}/password" >/dev/null 2>&1
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo -e "[ ${green}INFO${NC} ] Disable Ipv6... "
sleep 1
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
echo -e "[ ${green}INFO${NC} ] Updating... "
sleep 1
apt update -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Upgrading. "
apt upgrade -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Upgrading.. "
apt dist-upgrade -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Upgrading... "
apt-get remove --purge ufw firewalld -y >/dev/null 2>&1
apt-get remove --purge exim4 -y >/dev/null 2>&1

# install wget and curl
apt -y install wget curl >/dev/null 2>&1

# Install Requirements Tools
echo -e "[ ${green}INFO${NC} ] installing package... "
apt install ruby -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install make -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install cmake -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install coreutils -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install rsyslog -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install net-tools -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install zip -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install unzip -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install nano -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install sed -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install gnupg -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install gnupg1 -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install bc -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install jq -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install apt-transport-https -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install build-essential -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install dirmngr -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install libxml-parser-perl -y
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install neofetch -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install git -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install lsof -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install libsqlite3-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install libz-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install gcc -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install g++ -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install libreadline-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install zlib1g-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating. "
apt install libssl-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating.. "
apt install libssl1.0-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating... "
apt install dos2unix -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] ceck Update "
gem install lolcat >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Updating done "
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof >/dev/null 2>&1
echo "clear" >> .profile
echo "neofetch" >> .profile

# install webserver
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl >/dev/null 2>&1
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://${akbarvpn}/nginx.conf > /etc/nginx/nginx.conf
curl https://${akbarvpn}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://${akbarvpn}/index.html1" >/dev/null 2>&1
/etc/init.d/nginx restart
cd

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://${akbarvpn}/badvpn-udpgw64" >/dev/null 2>&1
chmod +x /usr/bin/badvpn-udpgw >/dev/null 2>&1
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local >/dev/null 2>&1
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local >/dev/null 2>&1
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500 >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500 >/dev/null 2>&1

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear >/dev/null 2>&1
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3 >/dev/null 2>&1
wget -O /etc/squid/squid.conf "https://${akbarvpn}/squid3.conf" >/dev/null 2>&1
sed -i $MYIP2 /etc/squid/squid.conf

# Install SSLH
apt -y install sslh >/dev/null 2>&1
rm -f /etc/default/sslh

# Settings SSLH
cat > /etc/default/sslh <<-END
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
# systemd users: don't forget to modify /lib/systemd/system/sslh.service
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:8880 --pidfile /var/run/sslh/sslh.pid -n"

END

# Restart Service SSLH
service sslh restart
systemctl restart sslh
/etc/init.d/sslh restart
/etc/init.d/sslh status
/etc/init.d/sslh restart

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel 5 
echo -e "[ ${green}INFO${NC} ] Installing Stunnel5... "
sleep 1
cd /root/
wget -q -O stunnel5.zip "https://${akbarvpnnnn}/stunnel5.zip" >/dev/null 2>&1
unzip -o stunnel5.zip >/dev/null 2>&1
cd /root/stunnel
chmod +x configure
./configure >/dev/null 2>&1
make >/dev/null 2>&1
make install >/dev/null 2>&1
cd /root
rm -r -f stunnel >/dev/null 2>&1
rm -f stunnel5.zip >/dev/null 2>&1
mkdir -p /etc/stunnel5
chmod 644 /etc/stunnel5

# Download Config Stunnel5
cat > /etc/stunnel5/stunnel5.conf <<-END
cert = /etc/xray/xray.crt
key = /etc/xray/xray.key
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 445
connect = 127.0.0.1:109

[openssh]
accept = 777
connect = 127.0.0.1:443

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END

# make a certificate
#openssl genrsa -out key.pem 2048
#openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
#-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
#cat key.pem cert.pem >> /etc/stunnel5/stunnel5.pem

# Service Stunnel5 systemctl restart stunnel5
cat > /etc/systemd/system/stunnel5.service << END
[Unit]
Description=Stunnel5 Service
Documentation=https://stunnel.org
Documentation=https://github.com/fsvpn
After=syslog.target network-online.target

[Service]
ExecStart=/usr/local/bin/stunnel5 /etc/stunnel5/stunnel5.conf
Type=forking

[Install]
WantedBy=multi-user.target
END

# Service Stunnel5 /etc/init.d/stunnel5
wget -q -O /etc/init.d/stunnel5 "https://${akbarvpnnnn}/stunnel5.init" >/dev/null 2>&1

# Ubah Izin Akses
chmod 600 /etc/stunnel5/stunnel5.pem
chmod +x /etc/init.d/stunnel5
cp /usr/local/bin/stunnel /usr/local/bin/stunnel5

# Remove File
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
#rm -f /usr/local/bin/stunnel5

# Restart Stunnel 5
systemctl stop stunnel5
systemctl enable stunnel5
systemctl start stunnel5
systemctl restart stunnel5
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel5 status
/etc/init.d/stunnel5 restart

#OpenVPN
echo -e "[ ${green}INFO${NC} ] Installing Openvpn... "
sleep 1
wget https://${akbarvpn}/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh >/dev/null 2>&1

# install fail2ban
apt -y install fail2ban >/dev/null 2>&1

# Instal DDOS Flate
echo -e "[ ${green}INFO${NC} ] Configure DDOS Deflate... "
sleep 1
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf >/dev/null 2>&1
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE >/dev/null 2>&1
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list >/dev/null 2>&1
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh >/dev/null 2>&1
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# Install BBR
wget https://${akbarvpn}/bbr.sh >/dev/null 2>&1 && chmod +x bbr.sh && ./bbr.sh >/dev/null 2>&1

# Ganti Banner
wget -O /etc/issue.net "https://${akbarvpn}/issue.net" >/dev/null 2>&1

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
echo -e "[ ${green}INFO${NC} ] Downloading Files... "
sleep 1
cd /usr/bin
wget -O addhost "https://${akbarvpn}/addhost.sh" >/dev/null 2>&1
wget -O about "https://${akbarvpn}/about.sh" >/dev/null 2>&1
wget -O stat "https://${akbarvpn}/stat.sh >/dev/null 2>&1
wget -O banner "https://${akbarvpn}/banner.sh >/dev/null 2>&1
wget -O menu "https://autosc.me/p/update/menu.sh" >/dev/null 2>&1
wget -O addssh "https://${akbarvpn}/addssh.sh" >/dev/null 2>&1
wget -O trialssh "https://${akbarvpn}/trialssh.sh" >/dev/null 2>&1
wget -O delssh "https://${akbarvpn}/delssh.sh" >/dev/null 2>&1
wget -O member "https://${akbarvpn}/member.sh" >/dev/null 2>&1
wget -O delexp "https://${akbarvpn}/delexp.sh" >/dev/null 2>&1
wget -O cekssh "https://${akbarvpn}/cekssh.sh" >/dev/null 2>&1
wget -O restart "https://${akbarvpn}/restart.sh" >/dev/null 2>&1
wget -O speedtest "https://${akbarvpn}/speedtest_cli.py" >/dev/null 2>&1
wget -O info "https://${akbarvpn}/info.sh" >/dev/null 2>&1
wget -O ram "https://${akbarvpn}/ram.sh" >/dev/null 2>&1
wget -O renewssh "https://${akbarvpn}/renewssh.sh" >/dev/null 2>&1
wget -O autokill "https://${akbarvpn}/autokill.sh" >/dev/null 2>&1
wget -O ceklim "https://${akbarvpn}/ceklim.sh" >/dev/null 2>&1
wget -O tendang "https://${akbarvpn}/tendang.sh" >/dev/null 2>&1
wget -O clearlog "https://${akbarvpn}/clearlog.sh" >/dev/null 2>&1
wget -O changeport "https://${akbarvpn}/changeport.sh" >/dev/null 2>&1
wget -O portovpn "https://${akbarvpn}/portovpn.sh" >/dev/null 2>&1
wget -O portwg "https://${akbarvpn}/portwg.sh" >/dev/null 2>&1
wget -O porttrojan "https://${akbarvpn}/porttrojan.sh" >/dev/null 2>&1
wget -O portsstp "https://${akbarvpn}/portsstp.sh" >/dev/null 2>&1
wget -O portsquid "https://${akbarvpn}/portsquid.sh" >/dev/null 2>&1
wget -O portvlm "https://${akbarvpn}/portvlm.sh" >/dev/null 2>&1
wget -O wbmn "https://${akbarvpn}/webmin.sh" >/dev/null 2>&1
wget -O xp "https://${akbarvpn}/xp.sh" >/dev/null 2>&1
wget -O swapkvm "https://${akbarvpn}/swapkvm.sh" >/dev/null 2>&1
wget -O addvmess "https://${akbarvpnn}/addv2ray.sh" >/dev/null 2>&1
wget -O addvless "https://${akbarvpnn}/addvless.sh" >/dev/null 2>&1
wget -O addtrojan "https://${akbarvpnn}/addtrojan.sh" >/dev/null 2>&1
wget -O delvmess "https://${akbarvpnn}/delv2ray.sh" >/dev/null 2>&1
wget -O delvless "https://${akbarvpnn}/delvless.sh" >/dev/null 2>&1
wget -O deltrojan "https://${akbarvpnn}/deltrojan.sh" >/dev/null 2>&1
wget -O cekvmess "https://${akbarvpnn}/cekv2ray.sh" >/dev/null 2>&1
wget -O cekvless "https://${akbarvpnn}/cekvless.sh" >/dev/null 2>&1
wget -O cektrojan "https://${akbarvpnn}/cektrojan.sh" >/dev/null 2>&1
wget -O renewvmess "https://${akbarvpnn}/renewv2ray.sh" >/dev/null 2>&1
wget -O renewvless "https://${akbarvpnn}/renewvless.sh" >/dev/null 2>&1
wget -O renewtrojan "https://${akbarvpnn}/renewtrojan.sh" >/dev/null 2>&1
wget -O certv2ray "https://${akbarvpnn}/certv2ray.sh" >/dev/null 2>&1
wget -O addtrgo "https://${akbarvpnnn}/addtrgo.sh" >/dev/null 2>&1
wget -O deltrgo "https://${akbarvpnnn}/deltrgo.sh" >/dev/null 2>&1
wget -O renewtrgo "https://${akbarvpnnn}/renewtrgo.sh" >/dev/null 2>&1
wget -O cektrgo "https://${akbarvpnnn}/cektrgo.sh" >/dev/null 2>&1
wget -O portsshnontls "https://autosc.me/p/websocket/portsshnontls.sh" >/dev/null 2>&1
wget -O portsshws "https://autosc.me/p/websocket/portsshws.sh" >/dev/null 2>&1

wget -O portsshnontls "https://autosc.me/s/websocket/portsshnontls.sh"
wget -O portsshws "https://autosc.me/s/websocket/portsshws.sh"
wget -O trial-menu "https://autosc.me/s/update/trial-menu.sh"
wget -O info-menu "https://autosc.me/s/update/info-menu.sh"
wget -O ssh-menu "https://autosc.me/s/update/ssh-menu.sh"
wget -O sstp-menu "https://autosc.me/s/update/sstp-menu.sh"
wget -O autokill-menu "https://autosc.me/s/update/autokill-menu.sh"
wget -O ipsec-menu "https://autosc.me/s/update/ipsec-menu.sh"
wget -O wg-menu "https://autosc.me/update/s/wg-menu.sh"
wget -O ss-menu "https://autosc.me/update/s/ss-menu.sh"
wget -O v2ray-menu "https://autosc.me/s/update/v2ray-menu.sh"
wget -O system-menu "https://autosc.me/s/update/system-menu.sh"
wget -O trojan-menu "https://autosc.me/s/update/trojan-menu.sh"
wget -O running "https://autosc.me/s/update/running.sh"

chmod +x portsshnontls
chmod +x portsshws
chmod +x ssh-menu
chmod +x trial-menu
chmod +x info-menu
chmod +x stat
chmod +x bannerku
chmod +x sstp-menu
chmod +x wg-menu
chmod +x ss-menu
chmod +x v2ray-menu
chmod +x system-menu
chmod +x trojan-menu
chmod +x autokill-menu
chmod +x addhost
chmod +x menu
chmod +x addssh
chmod +x trialssh
chmod +x delssh
chmod +x member
chmod +x delexp
chmod +x cekssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renewssh
chmod +x clearlog
chmod +x changeport
chmod +x portovpn
chmod +x portwg
chmod +x porttrojan
chmod +x portsstp
chmod +x portsquid
chmod +x portvlm
chmod +x wbmn
chmod +x xp
chmod +x swapkvm
chmod +x addvmess
chmod +x addvless
chmod +x addtrojan
chmod +x delvmess
chmod +x delvless
chmod +x deltrojan
chmod +x cekvmess
chmod +x cekvless
chmod +x cektrojan
chmod +x renewvmess
chmod +x renewvless
chmod +x renewtrojan
chmod +x certv2ray
chmod +x addtrgo
chmod +x deltrgo
chmod +x renewtrgo
chmod +x cektrgo
chmod +x running

echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y >/dev/null 2>&1
apt -y remove --purge unscd >/dev/null 2>&1
apt-get -y --purge remove samba*; >/dev/null 2>&1
apt-get -y --purge remove apache2*; >/dev/null 2>&1
apt-get -y --purge remove bind9*; >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
# finishing
sudo hostnamectl set-hostname FsidvpnProject
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/vnstat restart
/etc/init.d/fail2ban restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
