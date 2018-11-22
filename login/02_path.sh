# NOTE: Use `.Renviron` file to set R-specific minimal PATH.

# Add sbin.
export PATH="/usr/local/sbin:${PATH}"


# Python =======================================================================
# We're using Conda Python instead of Homebrew version (see koopa file).
# https://docs.brew.sh/Homebrew-and-Python
# brew info python
# python -V
# export PATH="/usr/local/opt/python/libexec/bin:${PATH}"


# Ruby =========================================================================
# https://github.com/rbenv/rbenv
# export PATH="~/.rbenv/shims:${PATH}"
command -v rbenv >/dev/null 2>&1 || {
    echo >&2 "rbenv missing"
    return 1
}
eval "$(rbenv init -)"


# Perl =========================================================================
# https://perlbrew.pl
# if [[ -f "${HOME}/perl5/perlbrew/etc/bashrc" ]]; then
#     . "${HOME}/perl5/perlbrew/etc/bashrc"
# fi
#
# # Ensembl Perl API
# ensembl="${HOME}/GitHub/ensembl/75"
# if [[ -d "$ensembl" ]]; then
#     export PATH="${ensembl}/ensembl-git-tools/bin:${PATH}"
#    
#     # perlbrew switch perl-5.14.4
#     PERL5LIB="${PERL5LIB}:${ensembl}/bioperl-1.6.1"
#     PERL5LIB="${PERL5LIB}:${ensembl}/ensembl/modules"
#     PERL5LIB="${PERL5LIB}:${ensembl}/ensembl-compara/modules"
#     PERL5LIB="${PERL5LIB}:${ensembl}/ensembl-variation/modules"
#     PERL5LIB="${PERL5LIB}:${ensembl}/ensembl-funcgen/modules"
#     export PERL5LIB
# fi
# unset -v ensembl


# Google Cloud SDK =============================================================
# Install using Homebrew Cask:
# brew cask install google-cloud-sdk

# dir="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
# if [[ -d $dir ]]; then
#     bash "${dir}/path.bash.inc"
#     bash "${dir}/completion.bash.inc"
# fi
# unset -v dir


# koopa ========================================================================
# https://github.com/steinbaugh/koopa/
CONDA_EXE="${HOME}/anaconda3/bin/conda"
KOOPA_EXE="${HOME}/koopa/bin/koopa"
source "${KOOPA_EXE}" activate
if [[ -n $(command -v conda) ]]; then
    conda activate steinbaugh
fi
