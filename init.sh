#!/bin/bash

EMAIL="victor.lofgren99@pm.me"

git config --global user.name "Victor Löfgren"
git config --global user.email $EMAIL
git config --global commit.gpgsign true


stat ~/.ssh/id_ed25519.pub > /dev/null
if [ $? -ne 0 ]; then
	ssh-keygen -t ed25519 -C $EMAIL
	cat ~/.ssh/id_ed25519.pub
fi

gpg --list-secret-keys | grep "$EMAIL" > /dev/null
if [ $? -ne 0 ]; then
	gpg --full-generate-key
	GPG_KEY_ID="$(gpg --list-secret-keys --keyid-format=long | grep '^sec' | cut -f2 -d'/' | cut -f1 -d' ')"
	gpg --armor --export $GPG_KEY_ID
fi

if [ $(systemctl is-enabled bluetooth) != "enabled" ]; then
	systemctl enable --now bluetooth
fi

stow -t ~ */

tmux source ~/.config/tmux/tmux.conf

if [ $SHELL != "/usr/bin/zsh" ]; then
	chsh -s /usr/bin/zsh
fi
