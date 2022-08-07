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

declare -A comments=([git add -A]="adding all files for commit"
[git commit -m "$message"]="committing"
[git push]="pushing changes"
)

for program in "${!filepaths[@]}"; do
    # create directory for program if it doesn't exist
    mkdir --parents $program

    # copy files from filepath to current directory
    printf "${GREEN}copying files for $program...${NOCOLOR}"
    cp -r ${filepaths[$program]} ./$program
    printf " done!\n"
done

for cmd in "${!comments[@]}"; do
    printf "${GREEN}${comments[$cmd]}${NOCOLOR}\n"
    $cmd
    [ $? != 0 ] && exit $?
    printf "done!\n"
done

printf "${GREEN}repo pushed succesfully!${NOCOLOR}\n"
