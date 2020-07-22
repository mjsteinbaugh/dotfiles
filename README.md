# Dot files

Configuration files shared between machines.

## Installation

I use the [koopa](https://github.com/acidgenomics/koopa/) bootloader to configure my shell automatically.

Via koopa:

```sh
koopa install-dotfiles
```

Or clone and install manually:

```sh
# Clone into ~/.config/dotfiles and symlink.
dotfiles_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/dotfiles"
mkdir -pv "$dotfiles_dir"
git clone --recursive git@github.com:mjsteinbaugh/dotfiles.git "$dotfiles_dir"
"${dotfiles_dir}/install"
```

## See also

- [GitHub does dotfiles](https://dotfiles.github.io/)
- [mathiasbynens's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [MikeMcQuaid's dotfiles](https://github.com/MikeMcQuaid/dotfiles)
- [thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles)
- [jimhester's dotfiles](https://github.com/jimhester/dotfiles)
- [vsbuffalo's dotfiles](https://github.com/vsbuffalo/dotfiles)
- [caarlos0's dotfiles](https://github.com/caarlos0/dotfiles)
- [roryk's dotfiles](https://github.com/roryk/dotfiles)
- [nsgrantham's dotfiles](https://github.com/nsgrantham/dotfiles)
- [rajshekhar26's dotfiles](https://github.com/rajshekhar26/dotfiles)

### Color themes

- [Dracula](https://draculatheme.com/)
- [Nord](https://www.nordtheme.com/)

### Emacs

- [Spacemacs](http://spacemacs.org/)
- [Doom Emacs](https://github.com/hlissner/doom-emacs)

### ZSH

- [Oh My Zsh](https://ohmyz.sh/)
- [Prezto](https://github.com/sorin-ionescu/prezto)
- [Antigen](http://antigen.sharats.me/)
- [Antibody](https://getantibody.github.io/)
