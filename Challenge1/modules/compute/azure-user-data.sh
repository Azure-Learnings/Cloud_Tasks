#! /bin/bash
sudo apt update
sudo apt install openjdk-11-jdk -y
sudo apt install nginx -y
sudo systemctl start nginx
echo "<h1>Azure Linux VM in Web Tier</h1>" | sudo tee /var/www/html/index.html