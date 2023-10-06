#!/bin/bash
set -ex
mkdir -p ~/.vnc ~/.config/xfce4
tar -xvf /app/panel.tar -C ~/.config/xfce4
rm -rf /usr/share/icons/Adwaita
cp -r /usr/share/icons/Humanity-Dark /usr/share/icons/Adwaita

mkdir -p /Desktop
cat << EOF >  /Desktop/Chromium.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Chromium
Comment=Access the Internet
Exec=/usr/bin/chromium-browser --no-sandbox --disable-dev-shm-usage
Icon=chromium-browser
Path=
Terminal=false
StartupNotify=true
EOF

#cat << EOF >  /Desktop/AnyDesk.desktop
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=AnyDesk
#Comment=
#Exec=/usr/bin/anydesk
#Icon=anydesk
#Path=
#Terminal=false
#StartupNotify=true
#EOF

chmod +x /Desktop/Chromium.desktop
exec supervisord -c /app/supervisord.conf
