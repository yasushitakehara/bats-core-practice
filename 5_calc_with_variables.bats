#!/bin/bash

set -euo pipefail

load '/usr/local/lib/bats-support/load.bash'
load '/usr/local/lib/bats-assert/load.bash'
load ./calc.sh

@test "add_with_variables NG" {
  left=10
  right=22
  echo "left=$left, right=$right" >&3
  run add_with_variables

  assert_success
  #assert_equal $add_result 32
}

@test "add_with_variables OK" {
  left=10
  right=22
  echo "left=$left, right=$right" >&3

  #do not use 'run'
  add_with_variables

  assert_equal $? 0
  assert_equal $add_result 32
}

@test "add_with_variables UPDATED OK" {
  left=10
  right=22
  echo "left=$left, right=$right" >&3

  run add_with_variables
  assert_success

  add_with_variables
  assert_equal $add_result 32
}