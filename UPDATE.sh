#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd -P)"

echo "Updating dotfiles."

(
    cd "$script_dir" || exit 1
    git clean -dfx
    git submodule init
    git fetch --all
    git pull
    git submodule update --init --recursive
)
