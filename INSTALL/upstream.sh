#!/usr/bin/env bash
set -Eeuxo pipefail

(
    echo "Installing dracula powershell."
    cd dracula/powershell
    git remote add upstream git@github.com:mjsteinbaugh/dracula-powershell.git
)

(
    echo "Installing dracula putty."
    cd dracula/putty
    git remote add upstream git@github.com:gkroon/dracula-putty.git
)
