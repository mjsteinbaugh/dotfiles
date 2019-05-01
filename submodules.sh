# Initialize submodules.
# These commands were used to prepare `.gitmodules` file.

# Dracula ======================================================================
# Consolidate the Dracula color themes available on GitHub.

# Vim ==========================================================================
# Using pack, for native Vim 8 package manager.
# This is now recommended instead of using pathogen.
git submodule add \
    git@github.com:mjsteinbaugh/vim-airline.git \
    pack/dist/start/vim-airline
git submodule add \
    git@github.com:mjsteinbaugh/vim-dracula.git \
    pack/dist/start/dracula-theme
git submodule add \
    git@github.com:mjsteinbaugh/vim-markdown.git \
    pack/dist/start/vim-markdown
git submodule add \
    git@github.com:mjsteinbaugh/Nvim-R.git \
    pack/dist/start/Nvim-R

