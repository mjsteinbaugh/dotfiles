#!/usr/bin/env bash

# What goes in here:
# Bash-specific settings that don't inherit in sub-shells.
# - set
# - shopt

# Enable for debugging:
# echo "BASHRC"
# export BASHRC=1

# Set up text editor.
# Using vi mode instead of emacs by default.
set -o vi

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

# Save multiline commands.
shopt -s cmdhist

# Correct minor directory changing spelling mistakes.
shopt -s cdspell
