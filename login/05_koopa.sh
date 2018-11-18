# koopa shell
# https://github.com/steinbaugh/koopa
CONDA_EXE="${HOME}/anaconda3/bin/conda"
KOOPA_EXE="${HOME}/koopa/bin/koopa"
source "${KOOPA_EXE}" activate
if [[ -n $(command -v conda) ]]; then
    conda activate steinbaugh
fi
