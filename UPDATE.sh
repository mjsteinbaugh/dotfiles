#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd -P)"

(
    cd "$script_dir" || exit 1
    git submodule update --init --recursive
)
