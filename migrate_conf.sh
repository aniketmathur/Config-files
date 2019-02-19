#!/usr/bin/env bash

# Get requirements from github.

echo "Installing tpm for tmux..."
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo
else
	echo "tpm already exists. Skipping..."
fi
echo "Plugins can be installed using 'prefix + I' from a tmux window."


echo "Installing Vundle for vim..."
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo
else
	echo "Vundle already exists. Skipping..."
fi
echo -n "If you haven't yet, you can setup Vundle using 'vim +PluginInstall +qall'"
echo " Or by running ':PluginInstall' while in vim command mode."

echo -e "Done!\n"
