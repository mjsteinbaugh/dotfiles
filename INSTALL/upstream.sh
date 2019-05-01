#!/usr/bin/env bash
set -Eeuo pipefail



# dracula powershell
(
    cd dracula/powershell
    git remote add upstream git@github.com:mjsteinbaugh/dracula-powershell.git
)



# dracula putty
(
    cd dracula/putty
    git remote add upstream git@github.com:gkroon/dracula-putty.git
)
