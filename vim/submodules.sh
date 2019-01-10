# Using pack (native Vim 8 package manager).
# Installing dependencies as submodules.

git submodule add --force \
    git@github.com:vim-airline/vim-airline.git \
    pack/dist/start/vim-airline
git submodule add --force \
    git@github.com:dracula/vim.git \
    pack/dist/start/dracula-theme

# After cloning, need to initialize the submodules.
git submodule init
git submodule update
# git submodule update --recursive

# How to update submodules.
git submodule update --remote --merge
git commit -m "Submodule update"
git push
