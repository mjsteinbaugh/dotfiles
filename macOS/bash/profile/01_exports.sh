# Environment variables
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

# PATH =========================================================================
# Use .Renviron for R-specific PATH
export PATH="/usr/local/sbin:${PATH}"

# Homebrew Python 3
# https://docs.brew.sh/Homebrew-and-Python
# brew info python
# python -V
# export PATH="/usr/local/opt/python/libexec/bin:${PATH}"
# We're using conda pyton instead (see koopa)
