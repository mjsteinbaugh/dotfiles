#!/usr/bin/env bash
set -Eeuo pipefail

# Update submodules.

git submodule update --remote --merge
git commit -m "Submodule update"
git push
