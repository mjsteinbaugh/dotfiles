#!/usr/bin/env bash
set -Eeuo pipefail

# Initialize the submodules.
git submodule init

# If necessary, here's how to de-initialize.
# git submodule deinit

git submodule update
# git submodule update --recursive

git submodule foreach git pull origin master

git submodule sync
git submodule status
