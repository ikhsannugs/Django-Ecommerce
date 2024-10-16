#!/bin/bash

# Set Permission for Directory
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-app
chmod 755 -R /home/ubuntu/django-app

# create log installation
cd /home/ubuntu/django-app
mkdir log

# Setting allowed hosts
IP=$(curl -s ifconfig.me)
sed -i "s/localhost/$IP/g" demo/settings.py

# Install Dependencies
echo "Starting install_dependencies.sh" > log/install_dependencies.log

python3.8 -m venv venv >> log/install_dependencies.log 2>&1
source venv/bin/activate >> log/install_dependencies.log 2>&1
pip install -r requirements.txt >> log/install_dependencies.log 2>&1

echo "Finished install_dependencies.sh" >> log/install_dependencies.log
# killall gunicorn
