# Call personal scripts prefixed with "mjs".

function mjs {
    local script="$1"
    shift 1
    . "${HOME}/.dotfiles/macOS/bash/scripts/${script}.sh" $*
}

function mjs-private {
    local script="$1"
    shift 1
    . "${HOME}/.dotfiles-private/macOS/bash/scripts/${script}.sh" $*
}
