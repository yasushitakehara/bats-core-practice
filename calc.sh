#!/bin/bash

set -euo pipefail

function add(){
    echo $(( $1 + $2 ))
}

function add_with_variables(){
    add_result=$(add "$left" "$right")
}

function greet(){
    echo "Hello, $1 san!"
}