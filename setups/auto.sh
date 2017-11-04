#!/bin/bash

scriptPath=$(readlink -f $0)
currentDirectory=$(dirname $scriptPath)
currentDirectory=$(realpath $currentDirectory)


cd $currentDirectory
for file in $(find ./**/* -name '*.sh')
do 
    sh $file
done
