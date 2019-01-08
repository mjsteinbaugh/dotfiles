" Vim configuration
" https://www.vim.org
"
" Consider using Neovim
" https://neovim.io
"
" References:
" - https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc



" Switch syntax highlighting on.
syntax on

" Always show ruler at bottom.
set ruler

" Don't make foo~ files.
set nobackup

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Indentation
set autoindent
set smarttab
if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif

" Whitespace
if has("multi_byte")
  set encoding=utf-8
  set list listchars=tab:»·,trail:·
else
  set list listchars=tab:>-,trail:.
endif

" Disable mouse integration.
set mouse=

" Enable copy to clipboard (macOS).
" https://stackoverflow.com/questions/677986
" Now Vy will work.
" :w !pbcopy
set clipboard=unnamed
