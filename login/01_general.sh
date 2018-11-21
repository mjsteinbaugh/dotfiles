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

# etc includes =================================================================
# Enable bash completion.
# This will fail if `set -u` is enabled.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
