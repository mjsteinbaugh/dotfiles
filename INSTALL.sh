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

if [[ "$os" == "darwin" ]]
then
    dir="os/darwin"
    dotfile -f "${dir}/Renviron"
elif [[ "$host" == "harvard-o2" ]]
then
    dir="host/harvard-o2"
    dotfile -f "${dir}/Renviron"
elif [[ "$host" == "harvard-odyssey" ]]
then
    dir="host/harvard-odyssey"
    dotfile -f "${dir}/Renviron"
fi

if [[ "${mike:-}" -eq 1 ]]
then
    dotfile -f gitconfig
fi
