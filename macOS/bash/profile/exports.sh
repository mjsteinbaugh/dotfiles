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
