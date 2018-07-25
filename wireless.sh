#!/bin/bash
# raspberry pi wireless network

sudo rm -rf /etc/network/interfaces.d/interfaces

echo "Input the WIFI name:"
read SSID
echo "Input the WIFI password:"
read PSK

sudo chmod ugo+w /etc/wpa_supplicant/wpa_supplicant.conf

sudo echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=CN

network={
  ssid=\"${SSID}\"
  psk=\"${PSK}\"
  key_mgmt=WPA-PSK
}" > /etc/wpa_supplicant/wpa_supplicant.conf

sudo reboot

