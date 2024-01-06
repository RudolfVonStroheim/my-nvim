#!/bin/bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
apt install nodejs neovim npm python python-pip
cp init.vim ~/.config/nvim
nvim -c ':PlugInstall|:CocInstall coc-json coc-html coc-sql coc-tabnine coc-svg coc-sh coc-pydocstring coc-jedi coc-dash-complete coc-git coc-clangd coc-calc coc-lightbulb coc-css coc-highlight coc-lsp-wl|:q'


