#!/usr/bin/env bash
set -Eeu -o pipefail

# shellcheck source=/dev/null
source "$(koopa header bash)"

rm -fr ~/.config/doom
rm -fr ~/.config/htop
rm -fr ~/.config/neofetch
rm -fr ~/.emacs.d
rm -fr ~/.emacs.d-doom
rm -fr ~/.emacs.d-spacemacs
rm -fr ~/.oh-my-zsh
rm -fr ~/.shrc

# Always create these dotfiles.
link-dotfile --force "condarc"
link-dotfile --force "gitignore"
link-dotfile --force "spacemacs"
link-dotfile --force "tmux.conf"
link-dotfile --force "vim"
link-dotfile --force "vimrc"

# FIXME Rethink this approach.

# Create local config files.
if [[ "$shared" -eq 0 ]]
then
    host_type="$(_koopa_host_type)"
    os_type="$(_koopa_os_type)"
    link-dotfile --force "Rprofile"
    link-dotfile --force "bash_profile"
    link-dotfile --force "bashrc"
    link-dotfile --force "kshrc"
    link-dotfile --force "shrc"
    link-dotfile --force "zshrc"
    # R
    if [[ "$os_type" == "darwin" ]]
    then
        link-dotfile --force "os/darwin/R"
    elif [[ "$host_type" == "harvard-o2" ]]
    then
        link-dotfile --force "host/harvard-o2/Renviron"
    elif [[ "$host_type" == "harvard-odyssey" ]]
    then
        link-dotfile --force "host/harvard-odyssey/Renviron"
    fi
fi

link-dotfile --force --config app/emacs/doom/config.d doom
link-dotfile --force --config app/htop
link-dotfile --force --config app/neofetch
link-dotfile --force app/conda/condarc
link-dotfile --force app/emacs/doom/emacs.d emacs.d-doom
link-dotfile --force app/emacs/spacemacs/emacs.d emacs.d-spacemacs
link-dotfile --force app/emacs/spacemacs/spacemacs.el spacemacs
link-dotfile --force app/emacs/spacemacs/spacemacs.el spacemacs
link-dotfile --force app/git/gitignore
link-dotfile --force app/r/Rprofile
link-dotfile --force app/tmux/tmux.conf
link-dotfile --force app/vim/vim.d vim
link-dotfile --force app/vim/vim.d vim
link-dotfile --force app/vim/vimrc
link-dotfile --force shell/bash/bash_profile
link-dotfile --force shell/bash/bashrc
link-dotfile --force shell/bash/inputrc
link-dotfile --force shell/zsh/zshrc

if _koopa_is_darwin
then
    link-dotfile --force --config app/alacritty
    link-dotfile --force os/darwin/app/git/gitconfig
else
    link-dotfile --force app/git/gitconfig
fi

if [[ "$mike" -eq 1 ]]
then
    link-dotfile --force Rprofile
    link-dotfile --force forward
fi

link-emacs spacemacs
