#!/bin/bash

# Allow root SSH login
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# Restart SSH service
systemctl restart sshd

echo "Root SSH login enabled. Please use caution."