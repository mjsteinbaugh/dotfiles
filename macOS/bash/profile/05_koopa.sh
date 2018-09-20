export CONDA_DIR="${HOME}/anaconda3/bin"

# koopa shell
# https://github.com/steinbaugh/koopa
if [[ -n "$PS1" ]] && [[ -f ~/koopa/koopa.sh ]]; then
    source ~/koopa/koopa.sh
fi

conda activate steinbaugh
