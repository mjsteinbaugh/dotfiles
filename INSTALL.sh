#!/usr/bin/env bash
set -Eeu -o pipefail

# shellcheck source=/dev/null
source "$(koopa header bash)"

private=0

while (("$#"))
do
    case "$1" in
        --private)
            private=1
            shift 1
            ;;
        *)
            _koopa_invalid_arg "$1"
            ;;
    esac
done

_koopa_h1 "Linking dotfiles."

rm -fr ~/.bash_logout
rm -fr ~/.bash_profile
rm -fr ~/.bashrc
rm -fr ~/.condarc
rm -fr ~/.config/doom
rm -fr ~/.config/htop
rm -fr ~/.config/neofetch
rm -fr ~/.emacs
rm -fr ~/.emacs.d
rm -fr ~/.emacs.d-doom
rm -fr ~/.emacs.d-spacemacs
rm -fr ~/.kshrc
rm -fr ~/.oh-my-zsh
rm -fr ~/.shrc
rm -fr ~/.zcompdump
rm -fr ~/.zsh_history
rm -fr ~/.zshrc

link-dotfile --force --config app/emacs/doom/config.d doom
link-dotfile --force --config app/htop
link-dotfile --force --config app/neofetch

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

if _koopa_is_macos
then
    link-dotfile --force --config app/alacritty
    link-dotfile --force os/macos/app/git/gitconfig
else
    link-dotfile --force app/git/gitconfig
fi

if _koopa_is_macos
then
    mkdir -pv "${HOME}/.R"
    ln -fnsv "${KOOPA_HOME}/os/macos/etc/R/Makevars" "${HOME}/.R/."
fi

if [[ "$private" -eq 1 ]]
then
    _koopa_h2 "Linking private dotfiles."
    _koopa_assert_is_github_ssh_enabled
    source_repo="git@github.com:mjsteinbaugh/dotfiles-private.git"
    target_dir="$(_koopa_config_prefix)/dotfiles-private"
    if [[ ! -d "$target_dir" ]]
    then
        git clone --recursive "$source_repo" "$target_dir"
    fi
    "${target_dir}/INSTALL.sh"
fi

_koopa_success "Installation of dotfiles was successful."
