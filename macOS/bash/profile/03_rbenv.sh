# rbenv
# export PATH="~/.rbenv/shims:${PATH}"
command -v rbenv >/dev/null 2>&1 || {
    echo >&2 "rbenv missing"
    return 1
}
eval "$(rbenv init -)"
