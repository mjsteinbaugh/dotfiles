# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases, functions, bindings, etc.
# https://unix.stackexchange.com/a/71258

# Enable for debugging:
# echo "ZSHRC"
# export ZSHRC=1

# Check if this is a login shell.
[ "$0" = "-zsh" ] && export LOGIN_ZSH=1

# Source shared shell configuration.
source ~/.shrc

# Use emacs bindings even with vim as EDITOR.
bindkey -e

# History file.
export HISTFILE=~/.zsh_history

# Don't show duplicate history entires.
setopt hist_find_no_dups

# Remove unnecessary blanks from history.
setopt hist_reduce_blanks

# Share history between instances.
setopt share_history

# Don't hang up background jobs.
setopt no_hup

# Allow tab completion in the middle of a word.
setopt COMPLETE_IN_WORD

# Keep background processes at full speed.
# setopt NOBGNICE

# Restart running processes on exit.
# setopt HUP

# Append history file.
# setopt APPEND_HISTORY

# For sharing history between zsh processes.
# setopt INC_APPEND_HISTORY
# setopt SHARE_HISTORY

# Automatically decide when to page a list of completions.
# LISTMAX=0

# Disable mail checking.
# MAILCHECK=0

# Autoload colors.
# autoload -U colors
# colors

# Fix backspace on Linux (Debian).
# [ -n "$LINUX" ] && bindkey "^?" backward-delete-char

# Fix delete key on macOS.
# [ -n "$MACOS" ] && bindkey '\e[3~' delete-char
