#!/bin/bash

if [ ! -x "$(command -v jsonlint)" ]
then
    npm install -g jsonlint
fi
