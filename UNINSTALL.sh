#!/usr/bin/env bash
set -Eeu -o pipefail

# Remove dot file symlinks.
# Modified 2019-06-17.

rm_dotfile() {
    path="${HOME}/.${1}"
    name="$(basename "$path")"
    if [[ -L "$path" ]]
    then
        printf "Removing '%s'.\n" "$name"
        rm -f "$path"
    elif [[ -f "$path" ]] || [[ -d "$path" ]]
    then
        printf "Not symlink: %s\n" "$name"
    fi
}

rm_dotfile dotfiles

rm_dotfile Renviron
rm_dotfile Rprofile
rm_dotfile atom
rm_dotfile bash_profile
rm_dotfile bashrc
rm_dotfile condarc
rm_dotfile doom.d
rm_dotfile forward
rm_dotfile gitconfig
rm_dotfile gitignore
rm_dotfile kshrc
rm_dotfile screenrc
rm_dotfile shrc
rm_dotfile spacemacs
rm_dotfile tmux.conf
rm_dotfile vim
rm_dotfile vimrc
rm_dotfile zshrc
