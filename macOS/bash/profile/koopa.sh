koopa_dir="${HOME}/koopa"
if [[ -d "$koopa_dir" ]]; then
    . "$koopa_dir/koopa.sh"
fi
unset -v koopa_dir
