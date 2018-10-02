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

echo "Welcome to the game!"
echo "Please guess how many files are in the current directory ($PWD)..."

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