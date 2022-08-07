#!/usr/bin/bash

getCommitMessage () {
    printf "enter commit message: "
    read message
    printf "messsage = \`$message\`\n"
}

runCommand () {
    local cmd=$1
    printf "command = \`$cmd\`\n"
    eval $cmd
    [ $? != 0 ] && exit $?
    printf "done!\n"
}

pushToGitHub () {
    runCommand "git add -A"
    runCommand "git commit -m \"$message\""
    runCommand "git push"
}

getCommitMessage
pushToGitHub
printf "repo pushed succesfully!\n"

