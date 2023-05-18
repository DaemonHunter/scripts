#!/bin/bash

apt update
apt install wget curl sudo ufw -y
apt upgrade -y
useradd -m -G sudo -s /bin/bash tactical
passwd tactical
ufw default deny incoming
ufw default allow outgoing
ufw allow https
ufw enable && ufw reload
su - tactical
wget https://raw.githubusercontent.com/amidaware/tacticalrmm/master/install.sh
chmod +x install.sh
echo "Please run ./install.sh to complete install"
echo "IP info for DNS"
ip a | grep eth0 | awk '/inet / {split($2, a, "/"); print a[1]}'
echo "Public IP Adderess"
curl wtfismyip.com/text
