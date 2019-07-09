#!/bin/bash

if [ ! "$TYPESCRIPT" -eq 0 ]
then
    echo ""
    echo "- Configure Typescript ... "
else
    exit 0
fi

. /setups/util/trace_output.sh
(
    npm install -g typescript
) 2>&1 | trace_output

