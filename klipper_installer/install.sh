#!/bin/bash
sudo apt update && sudo apt upgrade -y && sudo apt install -y git build-essential

# cmdline.txt
sudo nano /boot/firmware/cmdline.txt
# config.txt
sudo nano /boot/firmware/config.txt

cd ~/ && git clone https://github.com/dw-0/kiauh.git
cd ~/kiauh && ./kiauh.sh

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

# Clean-up
sudo apt clean;sudo apt autoclean;sudo apt autoremove
