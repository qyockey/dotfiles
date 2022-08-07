#!/usr/bin/sh

GREEN="\033[0;32m"
NOCOLOR="\033[0m"

printf "${GREEN}enter commit message: ${NOCOLOR}"
read message
printf '\n'

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
    # create directory for program if it doesn't exist
    mkdir --parents $program

    # copy files from filepath to current directory
    printf "${GREEN}copying files for $program...${NOCOLOR}"
    cp -r ${filepaths[$program]} ./$program
    printf " done!\n"
done

printf "${GREEN}adding all files for commit${NOCOLOR}\n"
git add -A
[ $? != 0 ] && exit $?
printf "done!\n"

printf "${GREEN}commiting${NOCOLOR}\n"
git commit -m "$message"
[ $? != 0 ] && exit $?
printf "done!\n"

printf "${GREEN}pushing changes${NOCOLOR}\n"
git push
[ $? != 0 ] && exit $?
printf "done!\n"

printf "${GREEN}repo pushed succesfully!${NOCOLOR}\n"
