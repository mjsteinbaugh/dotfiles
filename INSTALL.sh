#!/usr/bin/env bash
set -Eeuo pipefail

# Symlink the recommended default dot files.
# Modified 2019-06-14

# mike=1 ./INSTALL.sh

command -v koopa >/dev/null 2>&1 || {
    >&2 echo "koopa is not installed."
    exit 1
}

dotfile --force condarc
dotfile --force gitconfig
dotfile --force gitignore_global
dotfile --force Rprofile
dotfile --force shrc
dotfile --force spacemacs
dotfile --force tmux.conf
dotfile --force vim
dotfile --force vimrc
dotfile --force zshrc

if [[ "${mike:-}" -eq 1 ]]
then
    dotfile --force gitconfig
fi

list-dotfiles

