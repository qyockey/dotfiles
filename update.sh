#!/usr/bin/bash

GREEN="\033[0;32m"
NOCOLOR="\033[0m"

declare -A filepaths=(
    [alacritty]=~/.config/alacritty/*
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

runCommand () {
    local comment=$1
    local cmd=$2

    printf "${GREEN}$comment${NOCOLOR}\n"
    eval $cmd

    # halt on error
    [ $? != 0 ] && exit $?
    printf "done!\n"
}

getCommitMessage () {
    printf "${GREEN}enter commit message: ${NOCOLOR}"
    read message
    printf "\n"
}

updateFiles () {
    for program in "${!filepaths[@]}"; do
        # create directory for program if it doesn't exist
        mkdir --parents $program
    
        # copy files from filepath to current directory
        printf "${GREEN}copying files for $program...${NOCOLOR}"
        cp -r ${filepaths[$program]} ./$program
        printf " done!\n"
    done
}

pushToGitHub () {
    runCommand "adding all files for commit" "git add -A"
    runCommand "committing" "git commit -m \"$message\""
    runCommand "pushing changes" "git push"
}

getCommitMessage
updateFiles
pushToGitHub
printf "${GREEN}repo pushed succesfully!${NOCOLOR}\n"
