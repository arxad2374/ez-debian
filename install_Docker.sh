#!/bin/bash

# Update and upgrade the system
apt update
apt upgrade -y

# Set the PATH variable with common directories
export PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"

containerd_io_url=$(wget -qO- https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/ | grep -oP "href=\"containerd.io_[^\"]+\.deb\"" | awk -F '"' '{print $2}' | sort -V | tail -1)
wget "https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/${containerd_io_url}"
dpkg -i "${containerd_io_url}"
rm -f "${containerd_io_url}"

docker_ce_cli_url=$(wget -qO- https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/ | grep -oP "href=\"docker-ce-cli_[^\"]+\.deb\"" | awk -F '"' '{print $2}' | sort -V | tail -1)
wget "https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/${docker_ce_cli_url}"
dpkg -i "${docker_ce_cli_url}"
rm -f "${docker_ce_cli_url}"

docker_ce_url=$(wget -qO- https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/ | grep -oP "href=\"docker-ce_[^\"]+\.deb\"" | awk -F '"' '{print $2}' | sort -V | tail -1)
wget "https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/${docker_ce_url}"
dpkg -i "${docker_ce_url}"
rm -f "${docker_ce_url}"

docker_buildx_url=$(wget -qO- https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/ | grep -oP "href=\"docker-buildx-plugin_[^\"]+\.deb\"" | awk -F '"' '{print $2}' | sort -V | tail -1)
wget "https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/${docker_buildx_url}"
dpkg -i "${docker_buildx_url}"
rm -f "${docker_buildx_url}"

docker_compose_url=$(wget -qO- https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/ | grep -oP "href=\"docker-compose-plugin_[^\"]+\.deb\"" | awk -F '"' '{print $2}' | sort -V | tail -1)
wget "https://download.docker.com/linux/debian/dists/bookworm/pool/stable/amd64/${docker_compose_url}"
dpkg -i "${docker_compose_url}"
rm -f "${docker_compose_url}"

systemctl enable --now docker

echo "Script execution completed."
