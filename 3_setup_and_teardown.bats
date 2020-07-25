#!/bin/bash

set -euo pipefail

load ./calc.sh

setup_file(){
  echo "SETUP_FILE ONLY ONCE!" >&3
}

setup(){
  echo "SETUP" >&3
  aaa=333
}

teardown(){
  echo "TEARDOWN $aaa" >&3
}

teardown_file(){
  echo "TEARDOWN_FILE ONLY ONCE!" >&3
}

@test "setup and teardown 1" {
  echo "$BATS_TEST_NAME $aaa" >&3
  aaa=666
}

@test "setup and teardown 2" {
  echo "$BATS_TEST_NAME $aaa" >&3
  aaa=777
}