#!/bin/bash
sudo curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo apt install nodejs neovim npm python python-pip
npm ci coc.nvim
echo "Ready to install coc extensions"

