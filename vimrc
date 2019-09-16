" Vim configuration
" Updated 2019-09-16.
"
" See also:
" - https://www.vim.org
" - https://steinbaugh.com/posts/vim.html
" - https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc
" - https://gist.github.com/nerdalert/5f80853b4e195204bc6d
"
" Use 'finish' inside if / endif to early return.



" Keyboard                                                                  {{{1
" ==============================================================================

" Fix backspace key to work as expected.
" https://unix.stackexchange.com/a/307974
set backspace=indent,eol,start



" Text formatting                                                           {{{1
" ==============================================================================

" Wrapping and margins                                                      {{{2
" ------------------------------------------------------------------------------

" Enable soft wrapping.
" Use nowrap to disable.
set wrap

" Set the text line wrapping width.
" Note that this will add line breaks, which can be annoying.
" May want to enable this for specific file types instead.
" > set textwidth=80

" Here's how to disable automatic line breaks.
" https://stackoverflow.com/questions/2280030
set textwidth=0
set wrapmargin=0

" Set the right margin color column.
" Super useful when using soft wrapping.
" Added in Vim 7.3.
" https://stackoverflow.com/questions/2182427
set colorcolumn=80


" Spaces and tabs                                                           {{{2
" ------------------------------------------------------------------------------

" Prefer spaces over tabs. Sorry, Richard Hendricks.

" See also:
" - `:help smartindent`
" - https://stackoverflow.com/questions/234564

" Smart tab mode.
set smarttab

" Display tab (\t) visually as 4 spaces.
" Can also set using `ts` instead of `tabstop`.
set tabstop=4

" When indenting with ">", show as 4 spaces.
set shiftwidth=4

" Tab columns will display as 4 spaces.
set softtabstop=4

" Expand (detab) tab to spaces.
" This can be annoying when working with TSV files.
set expandtab

" Legacy method (no longer recommended).
" > set smartindent
" > set tabstop=4
" > set shiftwidth=4
" > set expandtab

" Alternate detab method.
" https://stackoverflow.com/a/323014/3911732
" > set expandtab ts=4 sw=4 ai
" Replace all the tabs with spaces in the entire file with:
" > :%retab


" Whitespace                                                                {{{2
" ------------------------------------------------------------------------------

" Enable file-type-specific indentation.
" > filetype plugin indent on
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

" Whitespace indicators.
if has("multi_byte")
    set encoding=utf-8
    set list listchars=tab:»·,trail:·
else
    set list listchars=tab:>-,trail:.
endif



" Navigation                                                                {{{1
" ==============================================================================

" Interface elements                                                        {{{2
" ------------------------------------------------------------------------------

" Highlight current line.
set cursorline

" Show command in bottom bar.
set showcmd

" Always show status line.
" Disable with `=0`.
set laststatus=2

" Always show ruler at bottom.
set ruler

" Command mode menus.
set wildmenu
set wildmode=list:longest,full


" Line numbers                                                              {{{2
" ------------------------------------------------------------------------------

" Enable line numbers.
" > set number

" Disable line numbers.
" Using this currently because it's easier to paste on Windows with tmux.
set nonumber


" Search (matching)                                                         {{{2
" ------------------------------------------------------------------------------

set ignorecase
set smartcase
set hlsearch
set incsearch

" Highlight matches.
set showmatch


" Mouse integration                                                         {{{2
" ------------------------------------------------------------------------------

" This doesn't work very well with PuTTY and/or inside tmux, so disabling.

" Enable mouse integration.
" `a` means all here.
" > set mouse=a

" Disable mouse integration.
set mouse=


" Folding                                                                   {{{2
" ------------------------------------------------------------------------------

set foldmethod=marker

" Disable collapsed folds by default.
" https://stackoverflow.com/questions/8316139
" Restore folds with `zc`.
set nofoldenable

" Completely disable Markdown-specific code folding.
" > let g:vim_markdown_folding_disabled=1
" Potentially useful:
" > let g:vim_markdown_folding_style_pythonic=1
" > let g:vim_markdown_override_foldtext=0
let g:vim_markdown_folding_level=2



" Colors                                                                    {{{1
" ==============================================================================

" For vim >= 8, use the dracula theme.
" For vim < 8, use the generic dark theme.
if v:version >= 800
    packadd! dracula-theme
    colorscheme dracula
else
    set background=dark
endif

" Enable syntax highlighting.
syntax on

" Enable 256 color support.
" This is useful when running inside PuTTY.
" https://gist.github.com/limingjie/4975c36d13d0927613e6
if &term == "screen"
    set t_Co=256
endif



" File management                                                           {{{1
" ==============================================================================

" Disable creation of `foo~` files.
" These are annoying and create file system cruft.
set nobackup

" Disable the swap file, if desired.
" This also creates FS cruft but is useful for recovery.
" > set noswapfile






" Plugins                                                                   {{{1
" ==============================================================================

" Nvim-R                                                                    {{{2
" ------------------------------------------------------------------------------

" Disable `_` to `<-`, which is ridiculous.
" > let vimrplugin_assign = 0
" https://stackoverflow.com/questions/44529713
let R_assign = 0


" jedi-vim                                                                  {{{2
" ------------------------------------------------------------------------------

" https://github.com/davidhalter/jedi-vim#settings

" > let g:jedi#use_splits_not_buffers = "left"
" > let g:jedi#use_tabs_not_buffers = 1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 1


" syntastic                                                                 {{{2
" ------------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" OS-specific                                                               {{{1
" ==============================================================================

if has("macunix")
    " Enable copy to clipboard (for macOS).
    " Now `Vy` will work.
    "
    " > :w !pbcopy
    " https://stackoverflow.com/questions/677986
    "
    " Note that this won't work for PuTTY on Windows. Instead, hold down SHIFT
    " and then you can highlight with the mouse. Yank doesn't integrate well
    " with the Windows clipboard unless you use X11 forwarding.
    " https://stackoverflow.com/a/4313348
    set clipboard=unnamed
endif



" Security                                                                  {{{1
" ==============================================================================

" Disable modeline.
" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline
