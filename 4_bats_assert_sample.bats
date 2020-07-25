#!/bin/bash

set -euo pipefail

load '/usr/local/lib/bats-support/load.bash'
load '/usr/local/lib/bats-assert/load.bash'
load ./calc.sh

@test "add by run (bats) OK" {
  run add 4 1

  # put values into some special variables for bats.
  [ "$status" -eq 0 ]
  [ "$output" -eq 9 ]
  [ "${lines[0]}" -eq 9 ]
}

@test "add by run (bats-assert) OK" {
  skip
  run add 4 1

  # put values into some special variables for bats.
  assert_success
  assert_output 9
  assert_line 9
}