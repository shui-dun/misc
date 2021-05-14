#!/bin/bash
#
sudo apt install -y zsh
chsh -s /bin/zsh
if [ -d /etc/zsh/ ]; then
  sudo cp $(dirname "$0")/zshrc /etc/zsh/zshrc
else
  sudo cp $(dirname "$0")/zshrc /etc/zshrc
fi
