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

@test "access a prepared file 1 (using relative path)" {
  assert_file_exist ./hoge.txt
}

@test "access a prepared file 2 NG (using absolute path)" {

  # reference - https://qiita.com/koara-local/items/2d67c0964188bba39e29
  result=$(cd $(dirname $0); pwd)
  echo "current path => ${result}" >&3
  assert_file_exist "${result}/hoge.txt"
}

@test "access a prepared file 3 OK (using absolute path)" {
  echo "BATS_TEST_DIRNAME => $BATS_TEST_DIRNAME" >&3
  assert_file_exist "${BATS_TEST_DIRNAME}/hoge.txt"
  assert_file_contains "${BATS_TEST_DIRNAME}/hoge.txt" ^abc123$
}