#!/bin/bash

read -p "File path: " -e path

read -p "Reset the file \"$path\"? [y/n] " answer
if [[ "$answer" != "y" ]]
then
    exit;
fi

git checkout HEAD -- $path
