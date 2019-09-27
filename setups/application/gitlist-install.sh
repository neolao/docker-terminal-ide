#!/bin/bash

if [ ! -d /applications/gitlist ]
then
    echo ""
    echo "- Install application: gitlist ... "

    . /setups/util/trace_output.sh
    (
        git clone https://github.com/klaussilveira/gitlist.git /applications/gitlist
    ) 2>&1 | trace_output
fi
