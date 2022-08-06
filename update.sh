#!/usr/bin/sh

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

printf "enter commit message: "
read message
echo ""

echo -e "${GREEN}copying files into ./alacritty/${NOCOLOR}"
cp -r ~/.config/alacritty/*  ./alacritty
echo -e "${GREEN}copying files into ./awesome/${NOCOLOR}"
cp -r ~/.config/awesome/*    ./awesome
echo -e "${GREEN}copying files into ./bash/${NOCOLOR}"
cp -r ~/.bashrc              ./bash
echo -e "${GREEN}copying files into ./emacs/${NOCOLOR}"
cp -r ~/.doom.d              ./emacs
echo -e "${GREEN}copying files into ./i3/${NOCOLOR}"
cp -r ~/.config/i3/*         ./i3
echo -e "${GREEN}copying files into ./neofetch/${NOCOLOR}"
cp -r ~/.config/neofetch/*   ./neofetch
echo -e "${GREEN}copying files into ./nvim/${NOCOLOR}"
cp -r ~/.config/nvim/*       ./nvim
echo -e "${GREEN}copying files into ./polybar/${NOCOLOR}"
cp -r /etc/polybar/*         ./polybar
echo -e "${GREEN}copying files into ./rofi/${NOCOLOR}"
cp -r ~/.config/rofi/*       ./rofi
echo -e "${GREEN}copying files into ./vim/${NOCOLOR}"
cp -r ~/.vimrc               ./vim
echo -e "${GREEN}copying files into ./zsh/${NOCOLOR}"
cp -r ~/.zshrc               ./zsh
echo ""

echo -e "${GREEN}adding all files for commit${NOCOLOR}"
git add -A
echo -e "${GREEN}commiting${NOCOLOR}"
git commit -m "$message"
echo -e "${GREEN}pushing changes${NOCOLOR}"
git push
echo -e "${GREEN}done!${NOCOLOR}"
