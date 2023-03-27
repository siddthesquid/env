#!/bin/bash
# This script exports `bootstrap`, which will download and run a shell script from
# the `bootstrap` directory of this repo
bootstrap() {
  curl -sL https://raw.githubusercontent.com/siddthesquid/env/master/bootstrap/$1.sh | bash
}