#!/usr/bin/sh

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

printf "${GREEN}enter commit message: ${NOCOLOR}"
read message
echo ""

declare -A filepaths=([alacritty]=~/.config/alacritty/*
[awesome]=~/.config/awesome/*
[bash]=~/.bashrc
[emacs]=~/.doom.d
[i3]=~/.config/i3/*
[neofetch]=~/.config/neofetch/*
[nvim]=~/.config/nvim/*
[polybar]=/etc/polybar/*
[rofi]=~/.config/rofi/*
[vim]=~/.vimrc
[zsh]=~/.zshrc
)

for program in "${!filepaths[@]}"; do
    #echo "$program:     ${filepaths[$program]}"
    
    # create directory for program if it doesn't exist
    mkdir --parents $program

    # copy files from filepath to current directory
    echo -e "${GREEN}copying files for $program${NOCOLOR}"
    cp -r ${filepaths[$program]} ./$program
done

echo -e "${GREEN}adding all files for commit${NOCOLOR}"
git add -A
[ $? != 0 ] && exit $?

echo -e "${GREEN}commiting${NOCOLOR}"
git commit -m "$message"
[ $? != 0 ] && exit $?

echo -e "${GREEN}pushing changes${NOCOLOR}"
git push
[ $? != 0 ] && exit $?

echo -e "${GREEN}done!${NOCOLOR}"
