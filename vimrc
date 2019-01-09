" Vim configuration
" https://www.vim.org
"
" Consider using Neovim
" https://neovim.io
"
" References:
" - https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc
" - https://gist.github.com/nerdalert/5f80853b4e195204bc6d



" Enable syntax highlighting.
syntax on

" Set line wrapping (text width).
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

" Highlight matches
set showmatch

" Disable mouse integration.
set mouse=

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



" Indentation ====
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



" Whitespace ====
if has("multi_byte")
  set encoding=utf-8
  set list listchars=tab:»·,trail:·
else
  set list listchars=tab:>-,trail:.
endif



" Searching ====
set ignorecase
set smartcase
set hlsearch
set incsearch



" Colors ====
" Use dracula theme.
" https://github.com/dracula/vim/blob/master/colors/dracula.vim
" ~/.vim/colors/dracula.vim
color dracula

" airline (powerbar) for status line.
" Run these commands in shell:
" git clone https://github.com/vim-airline/vim-airline \
"     ~/.vim/pack/dist/start/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes \
"     ~/.vim/pack/dist/start/vim-airline-themes

" Dracula airline theme.
let g:airline_theme='dracula'

