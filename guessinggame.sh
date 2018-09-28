#!/bin/bash
#
# Guessing game with one question regarding # of files in current directory,

function compare {
    if [[ $1 -gt $2 ]]; then
        echo 1
    elif [[ $1 -lt $2 ]]; then
        echo -1
    else
        echo 0
    fi
}

# init
match=-1
filesInDir=$(ls -A | wc -l)

# intro
echo "Welcome to the game! You need to guess on how many files are in the current directory ($PWD)"
echo "(!) 'how many files' means both files and directories, but excluding files from child dirs. Type any key to confirm you are ready to START..."
read ack

# main dialog
echo "So, it's time for your 1st guess..."
while [[ $match != 0 ]]; do
    read guess
    let match=$(compare $guess $filesInDir)
    case $match in
    1)  echo "You entered '$guess' value, which is too high, try again..."
        ;;
    -1) echo "You entered '$guess' value, which is too low, try again..."
        ;;
    0)  echo "Congratulations! You've won the game and can get back to your other activities :)"
        ;;
    esac
done