#!/bin/bash

set -euo pipefail

load ./calc.sh

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
  [ "${#lines[@]}" -eq 1 ]
}

@test "how to see echo OK" {
  echo "This sentence is not printed due to missing >&3..."
  echo "This sentence must be printed!" >&3
  run greet "Bob"
  echo "$output" >&3
}