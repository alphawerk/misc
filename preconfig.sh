#!/bin/bash


echo "Pre-config script running"
echo "Version 0.0.3"


sudo apt-get -yf update
sudo apt-get -yf upgrade
sudo apt-get -yf install docker.io docker-compose

sudo wget -O /usr/bin/fetch https://github.com/gruntwork-io/fetch/releases/download/v0.4.1/fetch_linux_amd64
sudo chmod 755 /usr/bin/fetch

sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce


