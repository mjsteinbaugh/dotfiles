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

- [mathiasbynens's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [MikeMcQuaid's dotfiles](https://github.com/MikeMcQuaid/dotfiles)
- [thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles)
- [jimhester's dotfiles](https://github.com/jimhester/dotfiles)
- [vsbuffalo's dotfiles](https://github.com/vsbuffalo/dotfiles)
- [caarlos0's dotfiles](https://github.com/caarlos0/dotfiles)
- [roryk's dotfiles](https://github.com/roryk/dotfiles)
- [nsgrantham's dotfiles](https://github.com/nsgrantham/dotfiles)
- [GitHub does dotfiles](https://dotfiles.github.io/)

### Color themes

- [Dracula](https://draculatheme.com/)
- [Nord](https://www.nordtheme.com/)

### Emacs

- [spacemacs](http://spacemacs.org/)
- [doom-emacs](https://github.com/hlissner/doom-emacs)

### ZSH

- [oh-my-zsh](https://ohmyz.sh/)
- [prezto](https://github.com/sorin-ionescu/prezto)
- [antigen](http://antigen.sharats.me/)
- [antibody](https://getantibody.github.io/)
