#!/usr/bin/env bash

[ -n "$BASH_PROFILE" ] && return
export BASH_PROFILE=1

# Source bashrc.
# shellcheck source=/dev/null
. ~/.bashrc
