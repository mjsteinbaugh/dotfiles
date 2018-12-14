# https://github.com/MikeMcQuaid/dotfiles/blob/master/zprofile.sh

# Load shared shell configuration.
source ~/.shprofile

# Enable completions.
autoload -U compinit && compinit

# Enable regex moving.
autoload -U zmv

# Colorful prompt with Git and Subversion branch.
autoload -U colors && colors
