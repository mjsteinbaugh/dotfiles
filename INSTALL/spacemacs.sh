#!/usr/bin/env bash
set -Eeuxo pipefail

# Back up existing emacs configuration, if necessary.
(
    cd ~
    if [ -d ".emacs.d" ]
    then
        echo "Backing up '.emacs.d' directory."
        mv .emacs.d .emacs.d.bak
    fi
)

# Now we're ready to install spacemacs.
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
