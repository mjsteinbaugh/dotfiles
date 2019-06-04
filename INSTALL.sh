#!/usr/bin/env bash
set -Eeuxo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

(
    cd "$script_dir"

    # Initialize the submodules.
    git submodule init

    # If necessary, here's how to de-initialize.
    # git submodule deinit

    git submodule update
    # git submodule update --recursive

    git submodule foreach git pull origin master

    git submodule sync
    git submodule status
)
