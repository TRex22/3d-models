#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y git build-essential

# cmdline.txt
# config.txt

cd ~/ && git clone https://github.com/dw-0/kiauh.git
cd ~/kiauh && ./kiauh.sh

sudo apt clean;sudo apt autoclean;sudo apt autoremove

# Install Pi MCU
# make menuconfig
# Set to Linux Process
sudo cp ./scripts/klipper-mcu.service /etc/systemd/system/
sudo systemctl enable klipper-mcu.service

sudo service klipper stop
make
make flash
sudo service klipper start

sudo usermod -a -G tty pi
