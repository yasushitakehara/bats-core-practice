#!/bin/bash

set -euo pipefail

load '/usr/local/lib/bats-support/load.bash'
load '/usr/local/lib/bats-assert/load.bash'
load ./calc.sh

@test "add by run (bats-assert) OK" {
  run add 4 1

  # put values into some special variables for bats.
  assert_success
  assert_output 5
}

# @test "You can NOT see the actual value when failure" {
#   run add 6 8

#   [ "$status" -eq 0 ]
#   [ "$output" -eq 13 ]
# }

# @test "You can see the actual value when failure" {
#   run add 6 8

#   assert_success
#   assert_output 13
# }