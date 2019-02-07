#!/usr/bin/env bash
set -Eeuo pipefail

# Using pack (native Vim 8 package manager).
# Installing dependencies as submodules.

# These commands were used to prepare `.gitmodules` file.
# git submodule add --force \
#     git@github.com:mjsteinbaugh/vim-airline.git \
#     pack/dist/start/vim-airline
# git submodule add --force \
#     git@github.com:mjsteinbaugh/vim-dracula.git \
#     pack/dist/start/dracula-theme
# git submodule add --force \
#     git@github.com:mjsteinbaugh/vim-markdown.git \
#     pack/dist/start/vim-markdown
# git submodule add --force \
#     git@github.com:mjsteinbaugh/Nvim-R.git \
#     pack/dist/start/Nvim-R

# Initialize the submodules.
git submodule init

# If necessary, here's how to de-initialize.
# git submodule deinit
