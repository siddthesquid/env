#!/bin/bash
# This script exports `install`, which will download and run a shell script from
# the `install` directory of this repo
install() {
  curl -sL https://raw.githubusercontent.com/siddthesquid/env/master/install/$1.sh | bash
}