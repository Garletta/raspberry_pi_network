#!/bin/bash
# raspberry pi wired network

sudo chmod ugo+w /etc/wpa_supplicant/wpa_supplicant.conf
sudo echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=CN" > /etc/wpa_supplicant/wpa_supplicant.conf

sudo chmod ugo+w /etc/network/interfaces
sudo echo "# interfaces(5) file used by ifup(8) and ifdown(8)

# Please note that this file is written to be used with dhcpcd
# For static IP, consult /etc/dhcpcd.conf and 'man dhcpcd.conf'

# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d
" > /etc/network/interfaces

sudo mkdir /etc/network/interfaces.d
sudo touch /etc/network/interfaces.d/interfaces
sudo chmod 766 /etc/network/interfaces.d/interfaces

echo "Input your static IP:"
read Address
echo "Input your gateway:"
read Gateway
echo "Input your netmask:"
read Netmask

sudo echo "auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static

address ${Address}

gateway ${Gateway}
netmask ${Netmask}
" > /etc/network/interfaces.d/interfaces

sudo reboot

