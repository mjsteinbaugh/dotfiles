#!/usr/bin/env zsh

# Z shell configuration.
# Modified 2019-06-13.

# Load the shared shell configuration.
source "${HOME}/.shrc"

# These steps are required to be sourced in `~/.zshrc` and won't set up properly
# if only called from `/etc/profile`.
zsh_dir="${KOOPA_DIR}/system/shell/zsh/"
source "${zsh_dir}/oh-my-zsh.sh"
source "${zsh_dir}/pure-prompt.sh"
source "${zsh_dir}/setopt.sh"
source "${zsh_dir}/bindkey.sh"
unset -v zsh_dir
