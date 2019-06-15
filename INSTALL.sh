#!/usr/bin/env bash
set -Eeuo pipefail

# Symlink the recommended default dot files.
# Modified 2019-06-14

# mike=1 ./INSTALL.sh

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd -P)"

command -v koopa >/dev/null 2>&1 || {
    >&2 echo "koopa is not installed."
    exit 1
}

echo "Symlinking dot files."

os="${KOOPA_OS_NAME:-}"
host="${KOOPA_HOST_NAME:-}"

# Symlink the dotfiles repo.
if [[ ! -d ~/.dotfiles ]]
then
    ln -fs "$script_dir" ~/.dotfiles
fi

dotfile -f Rprofile
dotfile -f bash_profile
dotfile -f bashrc
dotfile -f condarc
dotfile -f gitignore
dotfile -f kshrc
dotfile -f shrc
dotfile -f spacemacs
dotfile -f tmux.conf
dotfile -f vim
dotfile -f vimrc
dotfile -f zshrc

# Renviron
if [[ "$os" == "darwin" ]]
then
    dotfile -f os/darwin/Renviron
elif [[ "$host" == "harvard-o2" ]]
then
    dotfile -f host/harvard-o2/Renviron
elif [[ "$host" == "harvard-odyssey" ]]
then
    dotfile -f host/harvard-odyssey/Renviron
fi

# Mike only files.
if [[ "${mike:-}" -eq 1 ]]
then
    if [[ "$os" == "darwin" ]]
    then
    dotfile -f os/darwin/gitconfig
    else
        dotfile -f gitconfig
    fi
fi

