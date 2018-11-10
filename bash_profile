public_dir="${HOME}/.dotfiles"
private_dir="${HOME}/.dotfiles-private"
subdirs="login"

# Source public profile scripts.
if [[ -d "$public_dir" ]]; then
    for file in "${public_dir}/${subdirs}/"*; do
        source "$file"
    done
    unset -v file
fi

# Source private profile scripts.
if [[ -d "$private_dir" ]]; then
    for file in "${private_dir}/${subdirs}/"*; do
        source "$file"
    done
    unset -v file
fi

alias bioc="git push public bioconductor"
