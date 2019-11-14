#!/usr/bin/env bash
set -Eeu -o pipefail

rm dircolors
wget -O dircolors \
    https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors
