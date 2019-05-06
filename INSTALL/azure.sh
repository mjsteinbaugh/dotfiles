cd ~

rm -rf .koopa
git clone git@github.com:acidgenomics/koopa.git ~/.koopa

rm -rf .dotfiles
git clone git@github.com:mjsteinbaugh/dotfiles.git .dotfiles

rm -f .bashrc .bash_profile
ln -s .dotfiles/bashrc-azure .bashrc
ln -s .bashrc .bash_profile
