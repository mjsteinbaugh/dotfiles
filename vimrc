" Vim configuration
" https://www.vim.org
"
" Consider using Neovim
" https://neovim.io
"
" References:
" - https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc
" - https://gist.github.com/nerdalert/5f80853b4e195204bc6d



" Switch syntax highlighting on.
syntax on

" Disable mouse integration.
set mouse=

" Always show ruler at bottom.
set ruler

" Don't make foo~ files.
" These are annoying and create file system cruft.
set nobackup

" Fix backspace (delete) key for macOS.
" https://unix.stackexchange.com/a/307974
set backspace=indent,eol,start

" Enable copy to clipboard (for macOS).
" Now Vy will work.
" :w !pbcopy
" https://stackoverflow.com/questions/677986
set clipboard=unnamed



" Indentation
" Prefer spaces over tabs.
" Sorry, Richard Hendricks.
" See also:
" - :help smartindent
" - https://stackoverflow.com/questions/234564
set smarttab
if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif
" filetype plugin indent on
" Display tab (\t) visually as 4 spaces.
set tabstop=4
" When indenting with ">", show as 4 spaces.
set shiftwidth=4
" Tab columns will display as 4 spaces.
set softtabstop=4
" Expand (detab) tab to spaces.
set expandtab

" Legacy method (no longer recommended)
" set smartindent
" set tabstop=4
" set shiftwidth=4
" set expandtab

" Alternate detab method
" https://stackoverflow.com/a/323014/3911732
" set expandtab ts=4 sw=4 ai
" Now you can replace all the tabs with spaces in the entire file with:
" :%retab



" Whitespace
if has("multi_byte")
  set encoding=utf-8
  set list listchars=tab:»·,trail:·
else
  set list listchars=tab:>-,trail:.
endif



" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

