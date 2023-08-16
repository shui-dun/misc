#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install -y trash-cli vim tree net-tools zsh ssh neofetch htop cmake

for i in $(find $(dirname "$0") -name install.sh); do
  bash $i
done
