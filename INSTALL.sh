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

dotfile Rprofile
dotfile bash_profile
dotfile bashrc
dotfile condarc
dotfile gitignore_global
dotfile kshrc
dotfile shrc
dotfile spacemacs
dotfile tmux.conf
dotfile vim
dotfile vimrc
dotfile zshrc

if [[ "$os" == "darwin" ]]
then
    dotfile Renviron-darwin Renviron
elif [[ "$host" == "harvard-o2" ]]
then
    dotfile Renviron-harvard-o2 Renviron 
elif [[ "$host" == "harvard-odyssey" ]]
then
    dotfile Renviron-harvard-odyssey Renviron
fi

if [[ "${mike:-}" -eq 1 ]]
then
    dotfile gitconfig
fi

list-dotfiles

