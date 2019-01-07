#!/usr/bin/env ksh

# Enable for debugging.
# export KSHRC=1

# Source global definitions.
# shellcheck source=/dev/null
[ -f /etc/kshrc ] && . /etc/kshrc

# Set up text editor.
# Using vi mode instead of emacs by default.
set -o vi

# Source shared shell configuration.
# shellcheck source=/dev/null
. ~/.shrc
