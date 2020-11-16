#!/bin/bash

if echo $@ | grep -wq zsh ; then
	echo '************************开始配置zsh************************'
	apt install zsh
	if [ -d /etc/zsh/ ]; then
		cp ./zsh/zshrc /etc/zsh/zshrc
	else
		cp ./zsh/zshrc /etc/zshrc
	fi
fi

if echo $@ | grep -wq vim ; then
	echo '************************开始配置vim************************'
	apt install vim
	cp ./vim/.vimrc ~/.vimrc
fi

if echo $@ | grep -wq git ; then
	echo '************************开始配置git************************'
	cp ./git/.gitconfig ~/.gitconfig
fi
