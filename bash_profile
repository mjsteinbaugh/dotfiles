# What goes in here:
# Bash-specific settings that inherit in sub-shells.
# - koopa bootloader
# - History configuration
# - Completions
# - Prompt string (PS1)
# - Key bindings
# - conda environment activation

# Script order on login:
# 1. bash_profile
# 2. shprofile
# 3. bashrc
# 4. shrc

# Enable for debugging:
# echo "BASH_PROFILE"
# export BASH_PROFILE=1

# Ensure bashrc gets sourced.
source ~/.bashrc

# Check if this is a login and/or interactive shell.
[ "$0" = "-bash" ] && export LOGIN_BASH=1
echo "$-" | grep -q "i" && export INTERACTIVE_BASH=1

# Load shared shell configuration.
source ~/.shprofile

# Set HOST for ZSH compatibility.
export HOST="$HOSTNAME"

# History
# export HISTCONTROL="ignoredups"
# export HISTIGNORE="&:ls:[bf]g:exit"
# export PROMPT_COMMAND="history -a"
export HISTFILE="$HOME/.bash_history"

if [ -n "$INTERACTIVE_BASH" ]
then
    # Source global definitions.
    [ -r /etc/bashrc ] && . /etc/bashrc

    # Source Bash completions.
    [ -r /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
    [ -r /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

    # Define the prompt string and make colorful.
    # \!: the history number of this command
    # \#: the command number of this command
    # \H: hostname
    # \W: working directory basename
    # \h: hostname up to the first `.`
    # \n: newline
    # \r: carriage return
    # \s: shell name, the basename of `$0`
    # \u: username
    # \w: working directory
    user="\u@\h"
    history="[\!; \#]"
    wd="\w"
    prompt="\$"
    if [ "$USER" = "root" ]
    then
        user_color="35"
    elif [ -n "$SSH_CONNECTION" ]
    then
        user_color="36"
    else
        user_color="32"
    fi
    if [ $TERM = "xterm-256color" ]
    then
        user="\[\033[01;${user_color}m\]${user}\[\033[00m\]"
        wd="\[\033[01;34m\]${wd}\[\033[00m\]"
    fi
    export PS1="${user} ${history}\n${wd}\n${prompt} "
    unset -v user wd

    # Fix delete key on macOS.
    [ -n "$MACOS" ] && bind '"\e[3~" delete-char'

    # Alternate mappings for Ctrl-U/V to search the history.
    bind '"^u" history-search-backward'
    bind '"^v" history-search-forward'
fi

# Load koopa.
# https://github.com/steinbaugh/koopa/
# Note that this currently only works with bash.
# Source this after we've defined the prompt string.
if [ -n "$AZURE" ]
then
    export CONDA_DEFAULT_ENV="bioinfo"
elif [ -n "$MACOS" ]
then
    export CONDA_DEFAULT_ENV="steinbaugh"
fi
export KOOPA_EXE="${HOME}/koopa/bin/koopa"
source "${KOOPA_EXE}" activate
