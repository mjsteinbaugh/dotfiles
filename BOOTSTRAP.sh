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

link-emacs spacemacs
