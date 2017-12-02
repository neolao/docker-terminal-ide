#!/bin/bash

read -e -p "Branch name: " name

current=$(git symbolic-ref --short -q HEAD)
read -e -p "Based on branch: " -i "$current" base

read -e -p "From: " -i "origin" remote

read -e -p "Create the branch \"$name\" based on \"$remote/$base\"? [y/n] " -i "y" answer

if [[ "$answer" != "y" ]]
then
    exit;
fi

git fetch
git branch $name $remote/$base
git checkout $name
git push -u $remote $name
