#!/usr/bin/env bash
set -Eeuo pipefail

git submodule update
# git submodule update --recursive
git submodule foreach git pull origin master

git submodule sync
git submodule status

# How to update submodules.
git submodule update --remote --merge
git commit -m "Submodule update"
git push

