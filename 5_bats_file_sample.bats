#!/bin/bash

set -euo pipefail

load '/usr/local/lib/bats-support/load.bash'
load '/usr/local/lib/bats-assert/load.bash'
load '/usr/local/lib/bats-file/load.bash'

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