#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit
fi

# Install Samba
apt update
apt install -y samba

# Configure Samba
echo "[global]
   workgroup = WORKGROUP
   server string = Samba Server %v
   netbios name = debian
   security = user
   map to guest = bad user
   dns proxy = no

[shared]
   comment = Shared Folder
   path = /
   browseable = yes
   read only = no
   guest ok = yes
   create mask = 0644
   force user = root
   directory mask = 0755" > /etc/samba/smb.conf

# Restart Samba service
systemctl restart smbd

echo "Samba has been installed and configured successfully."
