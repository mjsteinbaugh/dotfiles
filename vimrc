" Vim configuration
" https://www.vim.org
"
" Consider using Neovim.
" https://neovim.io
"
" References:
" - https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc
" - https://gist.github.com/nerdalert/5f80853b4e195204bc6d



" Enable syntax highlighting.
syntax on

" Color theme.
color dracula

" Set the text line wrapping width.
set textwidth=80

" Show line numbers.
set number

" Show command in bottom bar.
set showcmd

" Highlight current line.
set cursorline

" Always show status line.
" Disable with `=0`.
set laststatus=2

" Always show ruler at bottom.
set ruler

" Show what you're typing as a command.
set showcmd

" Enable case insensitive mode.
" set ignorecase

" Highlight matches.
set showmatch

" Set mouse integration.
" `a` means all here.
set mouse=a
" set mouse=

" Disable creation of `foo~` files.
" These are annoying and create file system cruft.
set nobackup

" Disable the swap file, if desired.
" set noswapfile

" Fix backspace (delete) key for macOS.
" https://unix.stackexchange.com/a/307974
set backspace=indent,eol,start

" Enable copy to clipboard (for macOS).
" Now Vy will work.
" :w !pbcopy
" https://stackoverflow.com/questions/677986
set clipboard=unnamed

" Note that this won't work for PuTTY on Windows. Instead, hold down SHIFT and then
" you can highlight with the mouse. Yank doesn't integrate well with the Windows
" clipboard unless you use X11 forwarding.
" https://stackoverflow.com/a/4313348



" Indentation
" Prefer spaces over tabs. Sorry, Richard Hendricks.
" See also:
" - :help smartindent
" - https://stackoverflow.com/questions/234564

" Enable file-type-specific indentation.
" filetype plugin indent on
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

" Smart tab mode
set smarttab

" Display tab (\t) visually as 4 spaces.
" Can also set using `ts` instead of `tabstop`.
set tabstop=4

" When indenting with ">", show as 4 spaces.
set shiftwidth=4

" Tab columns will display as 4 spaces.
set softtabstop=4

" Expand (detab) tab to spaces.
set expandtab

" Legacy method (no longer recommended).
" set smartindent
" set tabstop=4
" set shiftwidth=4
" set expandtab

" Alternate detab method.
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


" Command mode menus
set wildmenu
set wildmode=list:longest,full



" ==============================================================================
" VIM 8+ specific
" ==============================================================================

" These settings require the new built-in package manager.

" if v:version < 800
"     finish
" endif

" Note that this is handled automatically by dracula plugin- now.
" Airline powerbar theme colors.
" Seems to be breaking inside tmux?
" https://github.com/vim-airline/vim-airline/issues/829
" let g:airline_theme='dracula'

