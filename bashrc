#!/usr/bin/env bash

[ -n "$BASHRC" ] && return
export BASHRC=1

# Check if this is a login and/or interactive shell.
[ "$0" = "-bash" ] && export LOGIN=1
echo "$-" | grep -q "i" && export INTERACTIVE=1

# Source global definitions.
[ -f /etc/bashrc ] && . /etc/bashrc



# Enable history appending instead of overwriting.
shopt -s histappend

# Save multiline commands.
shopt -s cmdhist



# Set HOST for ZSH compatibility.
export HOST="$HOSTNAME"

# History
# export HISTCONTROL="ignoredups"
# export HISTIGNORE="&:ls:[bf]g:exit"
# export PROMPT_COMMAND="history -a"
export HISTFILE="$HOME/.bash_history"

# Uncomment if you don't like systemcl's auto-paging feature.
# export SYSTEMD_PAGER=



if [ -n "$INTERACTIVE" ]
then
    # Set up text editor.
    # Using vi mode instead of emacs by default.
    set -o vi

    # Check the window size after each command.
    # If necessary, update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # Correct minor directory changing spelling mistakes.
    shopt -s cdspell

    # Source Bash completions.
    [ -f /etc/profile.d/bash-completion ] && . /etc/profile.d/bash-completion
    [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

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
    prompt="\$"
    # Unicode doesn't work with PuTTY on Windows.
    # prompt="❯"
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
    
    # Change the user color for SSH session.
    if [ -n "$SSH_CONNECTION" ]
    then
        user_color="33"
    else
        user_color="36"
    fi
    
    prompt_color="35"  # Matching zsh pure prompt.
    wd_color="34"
    
    if [ "$TERM" = "xterm-256color" ]
    then
        user="\[\033[01;${user_color}m\]${user}\[\033[00m\]"
        wd="\[\033[01;${wd_color}m\]${wd}\[\033[00m\]"
    fi
    
    PS1="\n${user} ${history}\n${wd}\n${prompt} "
    export PS1
    
    unset -v history prompt user user_color wd wd_color

    # Fix delete key on macOS.
    [ -n "$MACOS" ] && bind '"\e[3~" delete-char'

    # Alternate mappings for Ctrl-U/V to search the history.
    bind '"^u" history-search-backward'
    bind '"^v" history-search-forward'
fi



# Source shared shell configuration.
# shellcheck source=/dev/null
. ~/.shrc



# Powerline
# Disabled at the moment in favor of simply using airline in vim.
# Need to source this after shrc so we can get the powerline install path from conda.
# if [ -n "$POWERLINE_ROOT" ]
# then
#     . "${POWERLINE_ROOT}/bindings/bash/powerline.sh"
# fi
