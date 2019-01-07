#!/usr/bin/env zsh

# Enable for debugging.
# export ZSHRC=1



# oh-my-zsh ====================================================================
# Ignore warning about insecure directories identified by compfix.
ZSH_DISABLE_COMPFIX="true"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# We're using pure instead (see zprofile).
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# Dark the autosuggest text color.
# Define using xterm-256 color code.
# https://stackoverflow.com/questions/47310537
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# This works well in combo with Dracula theme.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'


# Autoload =====================================================================

# Info on `autoload -U`
# https://unix.stackexchange.com/questions/214296

# Enable completions.
#
# zsh compinit: insecure directories and files, run compaudit for list.
# This can freak out when using Homebrew zsh on a non-admin account.
#
# See also:
# - https://github.com/zsh-users/zsh-completions/issues/433
# - http://zsh.sourceforge.net/Doc/Release/Completion-System.html
# - https://github.com/zsh-users/zsh/blob/master/Completion/compinit
#
# Using the `-u` flag to ignore compaudit.
# autoload -U compinit; compinit
# autoload -U compinit -u; compinit -u

# Colorful prompt with Git branch information.
# autoload -U colors; colors

# Enable regex moving.
# autoload -U zmv



# Use emacs bindings even with vim as EDITOR.
# bindkey -e

# Automatically decide when to page a list of completions.
# LISTMAX=0

# Allow tab completion in the middle of a word.
setopt COMPLETE_IN_WORD

# Restart running processes on exit.
# setopt HUP

# Don't hang up background jobs.
setopt NO_HUP

# Keep background processes at full speed.
# setopt NOBGNICE



# History ======================================================================
# Set the history file path.
export HISTFILE=~/.zsh_history

# Append history file.
setopt APPEND_HISTORY

# For sharing history between zsh processes.
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Don't show duplicate history entires.
setopt HIST_FIND_NO_DUPS

# Remove unnecessary blanks from history.
setopt HIST_REDUCE_BLANKS



# Pure prompt ==================================================================
# This won't work if an oh-my-zsh theme is enabled (see above).
# This step must be sourced after oh-my-zsh.
#
# See also:
# - https://github.com/sindresorhus/pure
# - https://github.com/sindresorhus/pure/wiki
#
# Quick install using node:
# npm install --global pure-prompt
# Note that npm method requires write access into /usr/local (elevated).
# Let's configure manually instead, which also works on remote servers.

# .zshenv or .zshrc
fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure



# Source shared shell configuration.
# Ensure this is sourced last.
. ~/.shrc
