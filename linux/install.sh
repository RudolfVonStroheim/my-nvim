#!/bin/bash
apt install nodejs neovim npm python python-pip git exuberant-ctags 
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim
nvim -c ':PlugInstall<bar>CocInstall coc-json coc-html coc-sql coc-svg coc-sh coc-pydocstring coc-jedi coc-dash-complete coc-git coc-clangd coc-calc coc-lightbulb coc-css coc-highlight coc-lsp-wl<bar>MasonInstall arduino-language-server bash-debug-adapter cpptools debugpy pyright asmfnt<bar>q'


