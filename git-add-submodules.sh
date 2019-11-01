#!/usr/bin/env bash
set -Eeu -o pipefail

# See also:
# - https://stackoverflow.com/a/11258810/3911732
# - https://github.com/git/git/blob/master/git-submodule.sh
# - https://github.com/git/git/blob/a3fbb2350dcd2d843d1d90b663521222aceb25fe/git-submodule.sh#L132

modules="$(git config -f .gitmodules --get-regexp '^submodule\..*\.path$')"

# FIXME READ INTO ARRAY
# modules=("$modules")


while read -r path_key path
do
    url_key=$(echo $path_key | sed 's/\.path/.url/')
    url=$(git config -f .gitmodules --get "$url_key")
    echo "$url"
    echo "$path"
    # git submodule add $url $path
done
