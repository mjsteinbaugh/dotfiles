export CONDA_DIR="${HOME}/anaconda3/bin"

# koopa shell
# https://github.com/steinbaugh/koopa
source ~/koopa/bin/koopa activate

if [[ -n "$( command -v conda 2>/dev/null )" ]]; then
    conda activate steinbaugh
fi
