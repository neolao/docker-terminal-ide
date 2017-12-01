#!/bin/bash


trace_output() {
    echo "  │ "
    while read line; do
        echo "  │ $line"
    done
    echo "  │ "
}


