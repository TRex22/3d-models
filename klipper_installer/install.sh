#!/bin/bash

# cmdline.txt
sudo nano /boot/firmware/cmdline.txt
# config.txt
sudo nano /boot/firmware/config.txt

sudo apt update && sudo apt upgrade -y && sudo apt install -y git build-essential

cd ~/ && git clone https://github.com/dw-0/kiauh.git
cd ~/kiauh && ./kiauh.sh

# Install Pi MCU
# make menuconfig
# Set to Linux Process
# see: linux-process.cfg
sudo cp ./scripts/klipper-mcu.service /etc/systemd/system/
sudo systemctl enable klipper-mcu.service

sudo service klipper stop
make
make flash
sudo systemctl start klipper-mcu.service
sudo service klipper start

sudo systemctl status klipper-mcu.service

sudo usermod -a -G tty trex22

# Enable SPI and I2C
# sudo raspi-config

# Clean-up
sudo apt clean;sudo apt autoclean;sudo apt autoremove

# Upgrading the main mcu with flash
# See: ender-4.2.7.cfg
# Disconnect the screen

# Debugging
tail -200 ~/printer_data/logs/klippy.log
