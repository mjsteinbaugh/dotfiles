# Call personal scripts prefixed with "mjs".
function mjs {
    local script="$1"
    shift 1
    . "${HOME}/git/bash/${script}.sh" $*
}
