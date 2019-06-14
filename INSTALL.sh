#!/usr/bin/env bash
set -Eeuo pipefail

# Symlink the recommended default dot files.
# Modified 2019-06-14

# mike=1 ./INSTALL.sh

command -v koopa >/dev/null 2>&1 || {
    >&2 echo "koopa is not installed."
    exit 1
}

echo "Symlinking dot files."

os="${KOOPA_OS_NAME:-}"
host="${KOOPA_HOST_NAME:-}"

dotfile --force Rprofile
dotfile --force condarc
dotfile --force gitignore_global
dotfile --force shrc
dotfile --force spacemacs
dotfile --force tmux.conf
dotfile --force vim
dotfile --force vimrc
dotfile --force zshrc

if [[ "$os" == "darwin" ]]
then
    dotfile --force Renviron-darwin Renviron
elif [[ "$host" == "harvard-o2" ]]
then
    dotfile --force Renviron-harvard-o2 Renviron 
elif [[ "$host" == "harvard-odyssey" ]]
then
    dotfile --force Renviron-harvard-odyssey Renviron
fi

if [[ "${mike:-}" -eq 1 ]]
then
    dotfile --force gitconfig
fi

list-dotfiles

