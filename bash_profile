#!/usr/bin/env bash

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

# Enable for debugging.
export BASH_PROFILE=1

# Ensure bashrc gets sourced.
# shellcheck source=/dev/null
source ~/.bashrc

# Check if this is a login and/or interactive shell.
[ "$0" = "-bash" ] && export LOGIN_BASH=1
echo "$-" | grep -q "i" && export INTERACTIVE_BASH=1

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

    # Define the prompt string.
    # \#: the command number of this command
    # \!: the history number of this command
    # \H: hostname
    # \W: working directory basename
    # \h: hostname up to the first `.`
    # \n: newline
    # \r: carriage return
    # \s: shell name, the basename of `$0`
    # \u: username
    # \w: working directory
    
    history="[c\#; h\!]"
    # prompt="\$"
    prompt="❯"
    # Only show the user/host for SSH.
    user="\u@\h"
    wd="\w"
    
    # Foreground colors (text)
    # https://misc.flogisoft.com/bash/tip_colors_and_formatting
    # 39 default
    # 30 black
    # 31 red
    # 32 green
    # 33 yellow
    # 34 blue
    # 35 magenta
    # 36 cyan
    # 37 light gray
    # 90 dark gray
    # 91 light red
    # 92 light green
    # 93 light yellow
    # 94 light blue
    # 95 light magenta
    # 96 light cyan
    # 97 white
    
    user_color="33"
    prompt_color="35"  # Match zsh pure prompt.
    wd_color="34"
    
    if [ "$TERM" = "xterm-256color" ]
    then
        user="\[\033[01;${user_color}m\]${user}\[\033[00m\]"
        wd="\[\033[01;${wd_color}m\]${wd}\[\033[00m\]"
    fi
    
    PS1="${wd} ${history}\n${prompt} "
    
    # Only include the user and hostname for SSH/root.
    if [ -n "$SSH_CONNECTION" ] || [ "$USER" = "root" ]
    then
        PS1="${user}\n${PS1}"
    fi
    
    # Add an extra line break for improved legibility.
    PS1="\n${PS1}"
    export PS1
    
    unset -v history prompt user user_color wd wd_color

    # Fix delete key on macOS.
    [ -n "$MACOS" ] && bind '"\e[3~" delete-char'

    # Alternate mappings for Ctrl-U/V to search the history.
    bind '"^u" history-search-backward'
    bind '"^v" history-search-forward'
fi

# Load shared shell configuration.
source ~/.shprofile
