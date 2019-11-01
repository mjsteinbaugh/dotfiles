#!/usr/bin/env bash
set -Eeu -o pipefail

# > git config -f ".gitmodules" --list

# See also:
# - https://stackoverflow.com/a/11258810/3911732
# - https://github.com/git/git/blob/master/git-submodule.sh
# - https://github.com/git/git/blob/a3fbb2350dcd2d843d1d90b663521222aceb25fe/
#       git-submodule.sh#L132

mapfile -t path_arr \
    < <(git config -f ".gitmodules" --get-regexp '^submodule\..*\.path$')

echo "${#path_arr[@]} submodules detected."

for path_key in "${path_arr[@]}"
do
    path="$(echo "$path_key" | cut -d ' ' -f 2)"
    path_key="$(echo "$path_key" | cut -d ' ' -f 1)"
    url_key=$(echo $path_key | sed 's/\.path/.url/')
    url="$(git config -f ".gitmodules" --get "$url_key")"
    git submodule add --force "$url" "$path"
done
