export BASHRC=1

# Check if this is a login shell.
[ "$0" = "-bash" ] && export LOGIN_BASH=1

# Load shared shell configuration.
source ~/.shrc

# History
export HISTCONTROL="ignoredups"
export HISTFILE="$HOME/.bash_history"
# export HISTIGNORE="&:ls:[bf]g:exit"
export PROMPT_COMMAND="history -a"
