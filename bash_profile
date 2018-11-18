public_dir="${HOME}/.dotfiles/login"
private_dir="${HOME}/.dotfiles-private/login"

# Source public profile scripts.
if [[ -d "$public_dir" ]]; then
    for file in "${public_dir}/"*; do
        source "$file"
    done
    unset -v file
fi

# Source private profile scripts.
if [[ -d "$private_dir" ]]; then
    for file in "${private_dir}/"*; do
        source "$file"
    done
    unset -v file
fi
