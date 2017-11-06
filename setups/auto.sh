#!/bin/bash

scriptPath=$(readlink -f $0)
currentDirectory=$(dirname $scriptPath)
currentDirectory=$(realpath $currentDirectory)


cd $currentDirectory

# Configure
for file in $(find ./**/* -name '*-configure.sh')
do 
    sh $file
done

# Install
for file in $(find ./**/* -name '*-install.sh')
do 
    sh $file
done
