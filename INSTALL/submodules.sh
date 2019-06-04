#!/usr/bin/env bash
set -Eeuxo pipefail

# Initialize submodules.
# These commands were used to prepare `.gitmodules` file.

# Dracula ======================================================================
# Consolidate the Dracula color themes available on GitHub.
git submodule add \
    https://github.com/mjsteinbaugh/dracula-putty.git \
    dracula/putty
git submodule add \
    https://github.com/mjsteinbaugh/dracula-powershell.git \
    dracula/powershell

# Vim ==========================================================================
# Using pack, for native Vim 8 package manager.
# This is now recommended instead of using pathogen.
git submodule add \
    https://github.com/mjsteinbaugh/vim-airline.git \
    vim/pack/dist/start/vim-airline
git submodule add \
    https://github.com/mjsteinbaugh/vim-dracula.git \
    vim/pack/dist/start/dracula-theme
git submodule add \
    https://github.com/mjsteinbaugh/vim-markdown.git \
    vim/pack/dist/start/vim-markdown
git submodule add \
    https://github.com/mjsteinbaugh/Nvim-R.git \
    vim/pack/dist/start/Nvim-R

