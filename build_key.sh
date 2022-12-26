#!/usr/bin/env bash

set -eu
shopt -s globstar

SUMS=$(sha1sum $1 | sha1sum | awk '{ print $1 }')
echo "FLUTTER_BUILD_RUNNER_KEY=${SUMS}"
