# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install


# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall


# Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# Keep background processes at full speed
# setopt NOBGNICE

# Restart running processes on exit
# setopt HUP

# History
# setopt APPEND_HISTORY

# For sharing history between zsh processes
# setopt INC_APPEND_HISTORY
# setopt SHARE_HISTORY

# Never ever beep
# setopt NO_BEEP

# Automatically decide when to page a list of completions
# LISTMAX=0

# Disable mail checking
# MAILCHECK=0

# Autoload colors
# autoload -U colors
# colors

