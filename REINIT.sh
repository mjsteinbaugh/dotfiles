#!/usr/bin/env bash
set -Eeu -o pipefail

# Reinitialize Git submodules.
# Updated 2019-11-01.

# Note that this will currently wipe the Emacs installation directories.

# > man git submodule
# > git submodule add [--force] <REPO> <PATH>
# > git submodule update --init --recursive
# > git config -f ".gitmodules" --list

# See also:
# - https://stackoverflow.com/questions/11258737
# - https://stackoverflow.com/a/11258810/3911732
# - https://gist.github.com/nicktoumpelis/11214362
# - https://github.com/git/git/blob/master/git-submodule.sh
# - https://github.com/git/git/blob/a3fbb2350dcd2d843d1d90b663521222aceb25fe/
#       git-submodule.sh#L132

git clean -dfx
git submodule foreach --recursive git clean -dfx
git reset --hard
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive

mapfile -t path_arr \
    < <(git config -f ".gitmodules" --get-regexp '^submodule\..*\.path$')

echo "${#path_arr[@]} submodules detected."

for path_key in "${path_arr[@]}"
do
    path="$(echo "$path_key" | cut -d ' ' -f 2)"
    echo "$path"
    path_key="$(echo "$path_key" | cut -d ' ' -f 1)"
    url_key="${path_key//\.path/.url}"
    url="$(git config -f ".gitmodules" --get "$url_key")"
    git submodule add --force "$url" "$path"
done
