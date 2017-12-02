#!/bin/bash

echo -n "Tag name: "
read name

echo -n "Create the tag \"$name\"? [y/n] "
read answer

if [[ "$answer" != "y" ]]
then
    exit;
fi

git tag -a $name -m 'Version $name'
git push origin --tags
