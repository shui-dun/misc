#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install -y gcc g++ gdb net-tools trash-cli vim tree net-tools zsh ssh neofetch htop cmake sl cowsay cmatrix nodejs docker docker-compose openjdk-17-jdk silversearcher-ag ripgrep fzf

for i in $(find $(dirname "$0") -name install.sh); do
  bash $i
done
