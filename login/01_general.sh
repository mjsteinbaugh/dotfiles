# Aliases ======================================================================
alias autofs="sudo automount -vc"
alias emacs="emacs --no-window-system"
alias icloud="brctl log --wait --shorten"
alias public="git push public develop"
alias rstudio="open -a rstudio"

# Exports ======================================================================
# Environment variables
# Alternatively can use "emacs" here (e.g. for spacemacs).
export EDITOR="vim"
export TODAY=$(date +%Y-%m-%d)

# GnuPGP
# Enable passphrase prompting in terminal.
export GPG_TTY=$(tty)

# rsync
# --dry-run
# --one-file-system
# --acls --xattrs
# --iconv=utf-8,utf-8-mac
export RSYNC_FLAGS="--archive --copy-links --delete-before --human-readable --progress"
export RSYNC_FLAGS_APFS="${RSYNC_FLAGS} --iconv=utf-8,utf-8-mac"

# Ruby gems
export GEM_HOME="${HOME}/.gem"

# Homebrew now supports a global variable to force bottle installations.
# https://github.com/Homebrew/brew/pull/4520/files
# https://github.com/Homebrew/brew/pull/4542/files
export HOMEBREW_FORCE_BOTTLE="1"

# Add the date/time to `history` command output.
# Note that on macOS bash will fail if `set -e` is set and this isn't exported.
export HISTTIMEFORMAT="%Y%m%d %T  "

# PATH =========================================================================
# Use .Renviron for R-specific PATH
export PATH="/usr/local/sbin:${PATH}"

# We're using conda python instead of homebrew version (see koopa).
# Homebrew Python 3
# https://docs.brew.sh/Homebrew-and-Python
# brew info python
# python -V
# export PATH="/usr/local/opt/python/libexec/bin:${PATH}"

# Set Builtin ==================================================================
# Make bash stricter by default.
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

# For scripts, this one-liner can be placed under the shebang line:
# set -Eeuxo pipefail

# Exit immediately when a command fails.
set -e

# Catch ERR traps properly, which won't fire in certain scenarios for `-e` flag.
set -E

# Treat unset variables as an error and exit immediately.
set -u

# Alternatively, can use:
# shopt -s failglob

# Print each command before executing. This command is great for scripts but too
# noisy when added to bash_profile, and is not generally recommended here.
# set -x

# The bash shell normally only looks at the exit code of the last command of a
# pipeline. This behavior is not ideal as it causes the `-e` option to only be
# able to act on the exit code of a pipeline's last command. This is where
# `-o pipefail` comes in. This particular option sets the exit code of a
# pipeline to that of the rightmost command to exit with a non-zero status, or
# to zero if all commands of the pipeline exit successfully.
set -o pipefail

# Use vi mode instead of emacs by default.
set -o vi

# Bash v4 checks for these unbound variables.
EMACS=0
INSIDE_EMACS=0

# etc includes =================================================================
# Enable bash completion.
# This will fail if `set -u` is enabled.
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
