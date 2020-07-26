#!/bin/bash

set -euo pipefail

load '/usr/local/lib/bats-support/load.bash'
load '/usr/local/lib/bats-assert/load.bash'
load '/usr/local/lib/bats-file/load.bash'
load ./calc.sh

teardown() {
  rm -f ./temp*
}

@test "exists file OK" {
  assert_file_not_exist ./temp1.txt

  touch ./temp1.txt
  echo "aaa" > ./temp1.txt

  assert_file_exist ./temp1.txt
  assert_file_contains ./temp1.txt ^aaa$
}

@test "Be careful the current path!" {
  result=$(echo_current_path)
  echo "A) result => ${result}" >&3

  run echo_current_path
  echo "B) result => ${output}" >&3

  echo "ls => $(ls ${output})" >&3

  assert_file_exist ./hoge.txt
  #assert_file_exist "${result}/hoge.txt"
  #echo "absolute ls $(ls ${result})" >&3

  # If your function access other files, you need to fix the current path.
}