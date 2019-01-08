" Modified from these dot files:
" https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc


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
