# https://github.com/MikeMcQuaid/dotfiles/blob/master/bashrc.sh

# Check if this is a login shell.
[ "$0" = "-bash" ] && export LOGIN_BASH=1

# Source bash_profile if this is not a login shell.
[ -z "$LOGIN_BASH" ] && source ~/.bash_profile

# Load shared shell configuration.
source ~/.shrc

# History
export HISTCONTROL="ignoredups"
export HISTFILE="$HOME/.bash_history"
export HISTIGNORE="&:ls:[bf]g:exit"
export PROMPT_COMMAND="history -a"
