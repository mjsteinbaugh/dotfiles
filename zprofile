#!/usr/bin/env zsh

# Enable for debugging.
# export ZPROFILE=1

# Load shared shell configuration.
source ~/.shprofile

# Enable completions.
# zsh compinit: insecure directories and files, run compaudit for list.
# autoload -U compinit && compinit

# Enable regex moving.
autoload -U zmv

# Colorful prompt with Git and Subversion branch.
autoload -U colors && colors
