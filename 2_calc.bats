#!/bin/bash

set -euo pipefail

load ./calc.sh

#setup(){
#  echo "SETUP"
#  aaa=333
#}

#teardown(){
#  echo "TEARDOWN $aaa" >&3
#}

@test "add OK" {
  result="$(add 8 1)"
  [ "$result" -eq 9 ]
}

@test "add by run OK" {
  run add 8 1

  # put values into some special variables for bats.
  [ "$status" -eq 0 ]
  [ "$output" -eq 9 ]
  [ "${lines[0]}" -eq 9 ]
}

@test "how to see echo OK" {
  echo "hello!" >&3
  run greet "Hoge"
  echo "$output" >&3
}