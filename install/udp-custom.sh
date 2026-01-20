#!/bin/bash
MYIP=$(cat /usr/bin/.ipvps)
IZIN_FILE="/root/izin/ip"
IZIN=$(curl -sL "https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/izin/ip")
ALLOWED_IP=$(curl -sS "$IZIN" | grep "$MYIP" | awk '{print $4}')
if [[ "$MYIP" != "$ALLOWED_IP" ]]; then
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[41;1m ⚠️       ACCESS DENIED         ⚠️ \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "        \033[91;1m❌ SCRIPT LOCKED ❌\033[0m"
    echo -e ""
    echo -e "  \033[0;33m🔒 Your VPS\033[0m $MYIP \033[0;33mHas been Banned\033[0m"
    echo -e ""
    echo -e "  \033[91m⚠️  Active Period Has Expired ⚠️\033[0m"
    echo -e "  \033[0;33m💡 Purchase official licenses only from the Admin!\033[0m"
    echo -e ""
    echo -e "  \033[92;1m📞 Contact Admin:\033[0m"
    echo -e "  \033[96m🌍 Telegram: https://t.me/kuzavpn[0m"
    echo -e "  \033[96m📱 WhatsApp: https://wa.me/628971173434[0m"
    echo -e ""
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"

    # Hapus semua file di /root dan keluar
    rm -rf /root/*
    exit 1
fi

cd
mkdir -p /root/udp

# change to time GMT+7
echo "change to time GMT+7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
echo downloading udp-custom
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1_VyhL5BILtoZZTW4rhnUiYzc4zHOsXQ8' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1_VyhL5BILtoZZTW4rhnUiYzc4zHOsXQ8" -O /root/udp/udp-custom && rm -rf /tmp/cookies.txt
chmod +x /root/udp/udp-custom

echo downloading default config
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1_XNXsufQXzcTUVVKQoBeX5Ig0J7GngGM' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1_XNXsufQXzcTUVVKQoBeX5Ig0J7GngGM" -O /root/udp/config.json && rm -rf /tmp/cookies.txt
chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null