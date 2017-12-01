#!/bin/bash

if [ ! -x "$(command -v npm)" ]
then
    exit 0
fi

if [ -x "$(command -v jsonlint)" ]
then
    exit 0
fi


echo ""
echo "- Install NeoVim plugin: syntastic ..."

. /setups/util/trace_output.sh
(
    npm install -g jsonlint
) 2>&1 | trace_output

