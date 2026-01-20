#!/bin/bash
MYIP=$(cat /usr/bin/.ipvps)
IZIN_FILE="/root/izin/ip"
if [ -f "$IZIN_FILE" ]; then
    CEKIZIN=$(grep "$MYIP" "$IZIN_FILE" | awk '{print $4}')
else
    # Jika file tidak ada, cek dari variabel IZIN
    ALLOWED_IP=$(curl -sS "$IZIN" | grep "$MYIP" | awk '{print $4}')
    CEKIZIN=$ALLOWED_IP
fi
if [ "$MYIP" = "$CEKIZIN" ]; then
    echo -e "Permission Accepted..."
else
    rm -rf /root/*
    echo -e "Permission Denied!"
    exit 1
fi

file_path="/etc/handeling"

# Cek apakah file ada
if [ ! -f "$file_path" ]; then
    # Jika file tidak ada, buat file dan isi dengan dua baris
    echo -e "Satria Store\nGreen" | sudo tee "$file_path" > /dev/null
    echo "File '$file_path' berhasil dibuat."
else
    # Jika file ada, cek apakah isinya kosong
    if [ ! -s "$file_path" ]; then
        # Jika file ada tetapi kosong, isi dengan dua baris
        echo -e "Satria Store\nGreen" | sudo tee "$file_path" > /dev/null
        echo "File '$file_path' kosong dan telah diisi."
    else
        # Jika file ada dan berisi data, tidak lakukan apapun
        echo "File '$file_path' sudah ada dan berisi data."
    fi
fi
wget -O /usr/bin/ws "${REPO}sshws/ws"
wget -O /usr/bin/config.conf "${REPO}sshws/config.conf"
chmod +x /usr/bin/ws
cat > /etc/systemd/system/ws.service << END
[Unit]
Description=WebSocket E-Pro V1 By Nameless-Newbie
Documentation=https://github.com/nameless-newbie
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/usr/bin/ws -f /usr/bin/config.conf
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=65535
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target

END

systemctl daemon-reload
systemctl enable ws.service
systemctl start ws.service
systemctl restart ws.service

