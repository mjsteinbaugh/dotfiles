# Dotfiles

[Acid Genomics][] configuration files shared between machines.

## Installation

We use the [koopa][] bootloader to configure the shell automatically.

Install via koopa:

```sh
koopa install dotfiles
```

Or clone and install manually:

```sh
# Clone into '~/.config/dotfiles' and symlink.
repo='https://github.com/acidgenomics/dotfiles.git'
dotfiles_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/dotfiles"
mkdir -pv "$dotfiles_dir"
git clone --recursive "$repo" "$dotfiles_dir"
"${dotfiles_dir}/install"
```

## `main` branch rename

We renamed the default branch from `master` to `main` on 2021-04-08.
If you have installed koopa preivously, run this code to update the default branch:

```sh
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## Update submodules

```sh
git submodule update --init --recursive --remote
```

## See also

### What are dotfiles?

- [GitHub does dotfiles](https://dotfiles.github.io/)

### Example dotfiles

- [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [MikeMcQuaid](https://github.com/MikeMcQuaid/dotfiles)
- [jimhester](https://github.com/jimhester/dotfiles)
- [holman](https://github.com/holman/dotfiles)
- [thoughtbot](https://github.com/thoughtbot/dotfiles)
- [ryanb](https://github.com/ryanb/dotfiles)
- [vsbuffalo](https://github.com/vsbuffalo/dotfiles)
- [caarlos0](https://github.com/caarlos0/dotfiles)
- [roryk](https://github.com/roryk/dotfiles)
- [nsgrantham](https://github.com/nsgrantham/dotfiles)
- [rajshekhar26](https://github.com/rajshekhar26/dotfiles)
- [Mofiqul](https://github.com/Mofiqul/Dotfiles)
- [naggie](https://github.com/naggie/dotfiles)

### Color themes

- [Dracula](https://draculatheme.com/)
- [Nord](https://www.nordtheme.com/)

### Emacs configuration

- [Spacemacs](http://spacemacs.org/)
- [Doom Emacs](https://github.com/hlissner/doom-emacs)

### ZSH configuration

- [Oh My Zsh](https://ohmyz.sh/)
- [Prezto](https://github.com/sorin-ionescu/prezto)
- [Antigen](http://antigen.sharats.me/)
- [Antibody](https://getantibody.github.io/)

[acid genomics]: https://acidgenomics.com/
[koopa]: https://koopa.acidgenomics.com/
