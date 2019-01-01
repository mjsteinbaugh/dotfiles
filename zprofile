#!/usr/bin/env zsh

# Enable for debugging.
# export ZPROFILE=1

# Note that some zsh installations using autoload recommend placing in
# `~/.zshrc` but this doesn't work for me on macOS.
# https://sourabhbajaj.com/mac-setup/iTerm/zsh.html

# Info on `autoload -U`
# https://unix.stackexchange.com/questions/214296

# Enable completions.
# zsh compinit: insecure directories and files, run compaudit for list.
# This can freak out when using Homebrew zsh on a non-admin account.
# https://github.com/zsh-users/zsh-completions/issues/433
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html
# https://github.com/zsh-users/zsh/blob/master/Completion/compinit
# Use the `-u` flag to ignore compaudit
# autoload -U compinit; compinit
autoload -U compinit -u; compinit -u

# Enable regex moving.
autoload -U zmv

# Colorful prompt with Git and Subversion branch information.
autoload -U colors; colors

# Pure prompt
# https://github.com/sindresorhus/pure
# npm install --global pure-prompt
autoload -U promptinit; promptinit
prompt pure

# Load shared shell configuration.
source ~/.shprofile
