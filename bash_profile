# NOTE: Don't attempt to enable strict mode (i.e. set -euo pipefail) here.
# Otherwise, you can get locked out of a remote SSH server.

export BASH_PROFILE=1

# Load shared shell configuration.
source ~/.shprofile

# Check if this is a login and/or interactive shell.
[ "$0" = "-bash" ] && export LOGIN_BASH=1
echo "$-" | grep -q "i" && export INTERACTIVE_BASH=1

# Set HOST for ZSH compatibility.
export HOST="$HOSTNAME"

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

# Save multiline commands.
shopt -s cmdhist

# Correct minor directory changing spelling mistakes.
shopt -s cdspell

# Source global definitions.
[ -r /etc/bashrc ] && . /etc/bashrc

# Enable Bash completion.
[ -r /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
[ -r /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

# Customize the prompt string and make colorful.
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
elif [ -n "${SSH_CONNECTION}" ]
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

# Only set key bindings on interactive shell.
if [ -n "$INTERACTIVE_BASH" ]
then
    # fix delete key on macOS
    [ "$MACOS" ] && bind '"\e[3~" delete-char'

    # alternate mappings for Ctrl-U/V to search the history
    bind '"^u" history-search-backward'
    bind '"^v" history-search-forward'
fi

# koopa
# https://github.com/steinbaugh/koopa/
if [ -n "$AZURE" ]
then
    export CONDA_EXE="/usr/local/bin/miniconda3/bin/conda"
elif [ -n "$MACOS" ]
then
    export CONDA_EXE="${HOME}/anaconda3/bin/conda"
elif [ -n "$O2" ]
then
    export BCBIO_EXE="/n/app/bcbio/tools/bin/bcbio_nextgen.py"
    export CONDA_EXE="${HOME}/miniconda3/bin/conda"
elif [ -n "$ODYSSEY" ]
then
    export BCBIO_EXE="/n/regal/hsph_bioinfo/bcbio_nextgen/bin/bcbio_nextgen.py"
    export CONDA_EXE="${HOME}/miniconda3/bin/conda"
fi
KOOPA_EXE="${HOME}/koopa/bin/koopa"
source "${KOOPA_EXE}" activate

# Activate conda, if environment is defined.
if [ -n $(command -v conda) ]
then
    if [ -n "$AZURE" ]
    then
        conda_env="bioinfo"
    elif [ -n "$MACOS" ]
    then
        conda_env="steinbaugh"
    fi
    
    if [ -n "$conda_env" ]
    then
        conda activate "$conda_env"
    fi
    
    unset -v conda_env
fi
