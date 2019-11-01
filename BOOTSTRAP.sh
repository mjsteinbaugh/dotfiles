rm -fr ~/.config/doom
rm -fr ~/.config/htop
rm -fr ~/.config/neofetch

link-dotfile --force --config app/htop
link-dotfile --force --config app/neofetch
link-dotfile --force app/conda/condarc
link-dotfile --force app/git/gitignore
link-dotfile --force app/r/Rprofile
link-dotfile --force app/tmux/tmux.conf
link-dotfile --force app/vim/vim.d vim
link-dotfile --force app/vim/vimrc
link-dotfile --force os/darwin/app/git/gitconfig
link-dotfile --force shell/bash/bash_profile
link-dotfile --force shell/bash/bashrc
link-dotfile --force shell/zsh/zshrc

link-dotfile --force app/emacs/doom/emacs.d emacs.d-doom
link-dotfile --force app/emacs/spacemacs/emacs.d emacs.d-spacemacs
link-dotfile --force app/emacs/spacemacs/spacemacs.el spacemacs

# macOS only
# link-dotfile --force --config app/alacritty
