#!/bin/bash

set +e

CURRENT_HOSTNAME=`cat /etc/hostname | tr -d " \t\n\r"`
if [ -f /usr/lib/raspberrypi-sys-mods/imager_custom ]; then
   /usr/lib/raspberrypi-sys-mods/imager_custom set_hostname smart-hub
else
   echo smart-hub >/etc/hostname
   sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME/127.0.1.1\tsmart-hub/g" /etc/hosts
fi
FIRSTUSER=`getent passwd 1000 | cut -d: -f1`
FIRSTUSERHOME=`getent passwd 1000 | cut -d: -f6`
if [ -f /usr/lib/raspberrypi-sys-mods/imager_custom ]; then
   /usr/lib/raspberrypi-sys-mods/imager_custom enable_ssh -k 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCb0cQEB74OlGktzyk+Br9eO9+VhzY4BhpLii2DZy4gXwIU32g7scuFRLmpOtGWXhfziZQLVnbojR/zZkJieCp9TMKAibJPbWOibjP7JlHggAtrdcWGDUCNPDZxOhSqRMyR/GDD/pHvwznnYF1mHqkMZDTh+SM7lqep2S/dq8OkwBQQJ4kd55VnGsINk2fxjnINVeWSrzgI4+1PCbmk/yMxejwBRM8vzO9/iVMYICJ08EX8Q5+KDzN+/H5e8gdHdQJ7Q8vpJPUmoPjk5eTpG9F+f+SpnAxce3WvqrtbRj3UZcFbrgTWwbfeLR8m//oNhGN4P93hV9c95xWJtPItkLopICV8i6csxlTtG+yjyM9Bmk+3wQ0DCjXZnayA6/W0d6Sr50b9M9xZ5Q9PFt1DLk8EZOh3vOhqOK0GlfHTlCilb1qX95hbWyBTVBhLy9U29Co7dyQ3cw9cgzUMuKlNJ4QMZlFcGvoGgJqyc35btVbeVh9krmgQ3+0xuLASSwBLn9OAj9UebVSCNqYYwX9A9XLtsCGhRfyHiU6r+m/yAayhWjnPkoa2pK+qMZPWyHmrl81xuMq52CxMw2Z1fMs9yEqUQNFlAa2mIyL+aWwy6TYtKi6nvQMWb3eFFvJ++t8szyPcRxlo21wztk7fzw8J1JOQbVW+XjMOW5Ujfdu6zrgDoQ== vzotov@MacBook-Pro-3.local-deploy' 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCb0cQEB74OlGktzyk+Br9eO9+VhzY4BhpLii2DZy4gXwIU32g7scuFRLmpOtGWXhfziZQLVnbojR/zZkJieCp9TMKAibJPbWOibjP7JlHggAtrdcWGDUCNPDZxOhSqRMyR/GDD/pHvwznnYF1mHqkMZDTh+SM7lqep2S/dq8OkwBQQJ4kd55VnGsINk2fxjnINVeWSrzgI4+1PCbmk/yMxejwBRM8vzO9/iVMYICJ08EX8Q5+KDzN+/H5e8gdHdQJ7Q8vpJPUmoPjk5eTpG9F+f+SpnAxce3WvqrtbRj3UZcFbrgTWwbfeLR8m//oNhGN4P93hV9c95xWJtPItkLopICV8i6csxlTtG+yjyM9Bmk+3wQ0DCjXZnayA6/W0d6Sr50b9M9xZ5Q9PFt1DLk8EZOh3vOhqOK0GlfHTlCilb1qX95hbWyBTVBhLy9U29Co7dyQ3cw9cgzUMuKlNJ4QMZlFcGvoGgJqyc35btVbeVh9krmgQ3+0xuLASSwBLn9OAj9UebVSCNqYYwX9A9XLtsCGhRfyHiU6r+m/yAayhWjnPkoa2pK+qMZPWyHmrl81xuMq52CxMw2Z1fMs9yEqUQNFlAa2mIyL+aWwy6TYtKi6nvQMWb3eFFvJ++t8szyPcRxlo21wztk7fzw8J1JOQbVW+XjMOW5Ujfdu6zrgDoQ== vzotov@MacBook-Pro-3.local-deploy'
else
   install -o "$FIRSTUSER" -m 700 -d "$FIRSTUSERHOME/.ssh"
   install -o "$FIRSTUSER" -m 600 <(printf "'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCb0cQEB74OlGktzyk+Br9eO9+VhzY4BhpLii2DZy4gXwIU32g7scuFRLmpOtGWXhfziZQLVnbojR/zZkJieCp9TMKAibJPbWOibjP7JlHggAtrdcWGDUCNPDZxOhSqRMyR/GDD/pHvwznnYF1mHqkMZDTh+SM7lqep2S/dq8OkwBQQJ4kd55VnGsINk2fxjnINVeWSrzgI4+1PCbmk/yMxejwBRM8vzO9/iVMYICJ08EX8Q5+KDzN+/H5e8gdHdQJ7Q8vpJPUmoPjk5eTpG9F+f+SpnAxce3WvqrtbRj3UZcFbrgTWwbfeLR8m//oNhGN4P93hV9c95xWJtPItkLopICV8i6csxlTtG+yjyM9Bmk+3wQ0DCjXZnayA6/W0d6Sr50b9M9xZ5Q9PFt1DLk8EZOh3vOhqOK0GlfHTlCilb1qX95hbWyBTVBhLy9U29Co7dyQ3cw9cgzUMuKlNJ4QMZlFcGvoGgJqyc35btVbeVh9krmgQ3+0xuLASSwBLn9OAj9UebVSCNqYYwX9A9XLtsCGhRfyHiU6r+m/yAayhWjnPkoa2pK+qMZPWyHmrl81xuMq52CxMw2Z1fMs9yEqUQNFlAa2mIyL+aWwy6TYtKi6nvQMWb3eFFvJ++t8szyPcRxlo21wztk7fzw8J1JOQbVW+XjMOW5Ujfdu6zrgDoQ== vzotov@MacBook-Pro-3.local-deploy'\n'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCb0cQEB74OlGktzyk+Br9eO9+VhzY4BhpLii2DZy4gXwIU32g7scuFRLmpOtGWXhfziZQLVnbojR/zZkJieCp9TMKAibJPbWOibjP7JlHggAtrdcWGDUCNPDZxOhSqRMyR/GDD/pHvwznnYF1mHqkMZDTh+SM7lqep2S/dq8OkwBQQJ4kd55VnGsINk2fxjnINVeWSrzgI4+1PCbmk/yMxejwBRM8vzO9/iVMYICJ08EX8Q5+KDzN+/H5e8gdHdQJ7Q8vpJPUmoPjk5eTpG9F+f+SpnAxce3WvqrtbRj3UZcFbrgTWwbfeLR8m//oNhGN4P93hV9c95xWJtPItkLopICV8i6csxlTtG+yjyM9Bmk+3wQ0DCjXZnayA6/W0d6Sr50b9M9xZ5Q9PFt1DLk8EZOh3vOhqOK0GlfHTlCilb1qX95hbWyBTVBhLy9U29Co7dyQ3cw9cgzUMuKlNJ4QMZlFcGvoGgJqyc35btVbeVh9krmgQ3+0xuLASSwBLn9OAj9UebVSCNqYYwX9A9XLtsCGhRfyHiU6r+m/yAayhWjnPkoa2pK+qMZPWyHmrl81xuMq52CxMw2Z1fMs9yEqUQNFlAa2mIyL+aWwy6TYtKi6nvQMWb3eFFvJ++t8szyPcRxlo21wztk7fzw8J1JOQbVW+XjMOW5Ujfdu6zrgDoQ== vzotov@MacBook-Pro-3.local-deploy'\n") "$FIRSTUSERHOME/.ssh/authorized_keys"
   echo 'PasswordAuthentication no' >>/etc/ssh/sshd_config
   systemctl enable ssh
fi
if [ -f /usr/lib/userconf-pi/userconf ]; then
   /usr/lib/userconf-pi/userconf 'zotov' '$5$ZsIBuZiMSB$1cPCArI4usCbgJN.0G7OdviHhNIYxqqbQbqW4Cl7pX7'
else
   echo "$FIRSTUSER:"'$5$ZsIBuZiMSB$1cPCArI4usCbgJN.0G7OdviHhNIYxqqbQbqW4Cl7pX7' | chpasswd -e
   if [ "$FIRSTUSER" != "zotov" ]; then
      usermod -l "zotov" "$FIRSTUSER"
      usermod -m -d "/home/zotov" "zotov"
      groupmod -n "zotov" "$FIRSTUSER"
      if grep -q "^autologin-user=" /etc/lightdm/lightdm.conf ; then
         sed /etc/lightdm/lightdm.conf -i -e "s/^autologin-user=.*/autologin-user=zotov/"
      fi
      if [ -f /etc/systemd/system/getty@tty1.service.d/autologin.conf ]; then
         sed /etc/systemd/system/getty@tty1.service.d/autologin.conf -i -e "s/$FIRSTUSER/zotov/"
      fi
      if [ -f /etc/sudoers.d/010_pi-nopasswd ]; then
         sed -i "s/^$FIRSTUSER /zotov /" /etc/sudoers.d/010_pi-nopasswd
      fi
   fi
fi
if [ -f /usr/lib/raspberrypi-sys-mods/imager_custom ]; then
   /usr/lib/raspberrypi-sys-mods/imager_custom set_wlan 'TP-Link_C5EC' '627000c554bc4dacc735edccde72ba56bca38a3a657ae6029d7baf2d1851505f' 'RU'
else
cat >/etc/wpa_supplicant/wpa_supplicant.conf <<'WPAEOF'
country=RU
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
ap_scan=1

update_config=1
network={
	ssid="TP-Link_C5EC"
	psk=627000c554bc4dacc735edccde72ba56bca38a3a657ae6029d7baf2d1851505f
}

WPAEOF
   chmod 600 /etc/wpa_supplicant/wpa_supplicant.conf
   rfkill unblock wifi
   for filename in /var/lib/systemd/rfkill/*:wlan ; do
       echo 0 > $filename
   done
fi

# --- Bluetooth setup ---
echo "Configuring Bluetooth..."

# Разблокировать Bluetooth (на случай, если заблокирован)
rfkill unblock bluetooth

# Включить Bluetooth, сделать устройство видимым и разрешить сопряжение без таймаута
systemctl enable bluetooth
systemctl start bluetooth

# Установим имя устройства (по желанию)
bluetoothctl system-alias "smart-hub"

# Уберём ограничение на видимость
echo "DiscoverableTimeout = 0" >> /etc/bluetooth/main.conf
echo "PairableTimeout = 0" >> /etc/bluetooth/main.conf
sed -i 's/^#\(DiscoverableTimeout\|PairableTimeout\).*/\1 = 0/' /etc/bluetooth/main.conf
# --- End Bluetooth setup ---


# --- Mosquitto setup ---
echo "Setting up Mosquitto configuration directories..."

# Создание директорий
mkdir -p /smart_home/mosquitto/config
mkdir -p /smart_home/mosquitto/data
mkdir -p /smart_home/mosquitto/log

# Создание конфигурационного файла
cat << 'EOF' > /smart_home/mosquitto/config/mosquitto.conf
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log

listener 1883
allow_anonymous true
EOF

# Выдаём права
chown -R zotov:zotov /smart_home/mosquitto
chmod -R 755 /smart_home/mosquitto

echo "Mosquitto configuration created at /smart_home/mosquitto/config/mosquitto.conf"
# --- End Mosquitto setup ---




# --- Create Portainer startup script for zotov ---
cat << 'EOF' > /home/zotov/start_portainer.sh
#!/bin/bash
set -e

echo "=== Docker Installation & Portainer Setup ==="

# --- Docker setup ---
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker and Docker Compose..."
    curl -fsSL https://get.docker.com | sudo sh
    sudo usermod -aG docker zotov
    sudo systemctl enable docker
    sudo systemctl start docker

    # Установка docker-compose (v2)
    sudo apt-get update -y
    sudo apt-get install -y docker-compose-plugin
    newgrp docker

    echo "Docker installation complete."
else
    echo "Docker already installed. Skipping installation."
fi

# Проверка версии
docker --version || { echo "❌ Docker not installed correctly"; exit 1; }
docker compose version || echo "⚠️ Docker Compose plugin not found"
# --- End Docker setup ---

# Вход в приватный Docker Registry
echo "Logging into private Docker registry..."
sudo docker login registry.smart-home-pnz.ru -u admin
if [ $? -ne 0 ]; then
  echo "❌ Docker login failed. Aborting."
  exit 1
fi

# Запрос EDGE_ID и EDGE_KEY
read -p "Enter EDGE_ID: " EDGE_ID
read -p "Enter EDGE_KEY: " EDGE_KEY

# Запуск Portainer Edge Agent
echo "Starting Portainer Edge Agent container..."
sudo docker run -d \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  -v /:/host \
  -v portainer_agent_data:/data \
  -v /root/.docker:/root/.docker:ro \
  -e EDGE=1 \
  -e EDGE_ID="$EDGE_ID" \
  -e EDGE_KEY="$EDGE_KEY" \
  -e EDGE_INSECURE_POLL=1 \
  -e DOCKER_CONFIG=/root/.docker \
  --name portainer_edge_agent \
  portainer/agent:2.33.2


echo "✅ Setup complete!"
EOF

chmod +x /home/zotov/start_portainer.sh
chown zotov:zotov /home/zotov/start_portainer.sh
echo "Created /home/zotov/start_portainer.sh — run it manually after login."
# --- End Portainer script ---




rm -f /boot/firstrun.sh
sed -i 's| systemd.run.*||g' /boot/cmdline.txt
exit 0
