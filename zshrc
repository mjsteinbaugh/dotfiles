#!/usr/bin/env zsh

## Z shell configuration.
## Updated 2019-07-26.

## Load the shared shell configuration.
source "${HOME}/.shrc"

## These steps are required to be sourced in `~/.zshrc` and won't set up
## properly if only called from `/etc/profile`.
if [[ -z "${KOOPA_MINIMAL:-}" ]]
then
    zsh_dir="${KOOPA_HOME:-}/system/activate/shell/zsh/"
    if [[ ! -d "$zsh_dir" ]]
    then
        >&2 printf "Error: Failed to load koopa zsh scripts.\n"
        >&2 printf "%s\n" "$zsh_dir"
        return 1
    fi
    source "${zsh_dir}/oh-my-zsh.sh"
    source "${zsh_dir}/pure-prompt.sh"
    source "${zsh_dir}/setopt.sh"
    source "${zsh_dir}/bindkey.sh"
    unset -v zsh_dir
fi
