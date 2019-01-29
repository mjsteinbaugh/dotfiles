" Vim configuration
" https://www.vim.org
"
" Consider using Neovim.
" https://neovim.io
"
" References:
" - https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc
" - https://gist.github.com/nerdalert/5f80853b4e195204bc6d



" Enable 256 color support (in PuTTY)
" https://gist.github.com/limingjie/4975c36d13d0927613e6
if &term == "screen"
  set t_Co=256
endif

set background=dark



" Enable syntax highlighting.
syntax on



" Color theme.
color dracula



" Enable soft wrapping.
" Use nowrap to disable.
set wrap

" Set the text line wrapping width.
" Note that this will add line breaks, which can be annoying.
" May want to enable this for specific file types instead.
" set textwidth=80

" Here's how to disable automatic line breaks.
" https://stackoverflow.com/questions/2280030
set textwidth=0
set wrapmargin=0

" Set the right margin color column.
" Super useful when using soft wrapping.
" Added in Vim 7.3.
" https://stackoverflow.com/questions/2182427
set colorcolumn=80



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



" Whitespace indicators.
if has("multi_byte")
    set encoding=utf-8
    set list listchars=tab:»·,trail:·
else
    set list listchars=tab:>-,trail:.
endif



" Searching.
set ignorecase
set smartcase
set hlsearch
set incsearch



" Command mode menus.
set wildmenu
set wildmode=list:longest,full



" Markdown fold style.
"
" Completely disable Markdown-specific code folding.
" let g:vim_markdown_folding_disabled = 1
"
" Here's how to disable code folding globally in vim.
" set [no]foldenable
"
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 2



" ==============================================================================
" VIM 8+ specific
" ==============================================================================

" These settings require the new built-in package manager.

" if v:version < 800
"     finish
" endif

" Note that this is handled automatically by dracula plugin now.
" Airline powerbar theme colors.
" Seems to be breaking inside tmux?
" https://github.com/vim-airline/vim-airline/issues/829
" let g:airline_theme='dracula'

