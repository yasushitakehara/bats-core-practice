#!/bin/bash

set -euo pipefail

function add(){
    echo $(( $1 + $2 ))
}

function greet(){
    echo "Hello, $1!"
}