# # perlbrew
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
