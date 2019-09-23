" Vim configuration
" Updated 2019-09-23.
"
" See also:
" - https://www.vim.org
" - https://steinbaugh.com/posts/vim.html
" - https://github.com/MikeMcQuaid/dotfiles/blob/master/vimrc
" - https://gist.github.com/nerdalert/5f80853b4e195204bc6d
"
" Use 'finish' inside if/else conditional to early return.
"
" Version specific conditionals:
" > if v:version >= 800
" >     set background=dark
" > else
" >     set background=light
" > endif



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

packadd! dracula-theme
colorscheme dracula


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

" This plugin is awesome, and lets you run an R session inside if vim.
" Conceptually, it works similarly to ESS for Emacs.

" Usage
" https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/doc/Nvim-R.txt
" Copied from source on 2019-09-16.
"
" Note: The <LocalLeader> is '\' by default.
"
" To use the plugin, open a .R, .Rnw, .Rd, .Rmd or .Rrst file with Vim and
" type <LocalLeader>rf. Then, you will be able to use the plugin key bindings to
" send commands to R.
"
" This plugin has many key bindings, which correspond with menu entries. In the
" list below, the backslash represents the <LocalLeader>. Not all menu items and
" key bindings are enabled in all filetypes supported by the plugin (r, rnoweb,
" rhelp, rrst, rmd).
"
" Menu entry                                Default shortcut~
" Start/Close
"   . Start R (default)                                  \rf
"   . Start R (custom)                                   \rc
"   --------------------------------------------------------
"   . Close R (no save)                                  \rq
"   . Stop R                                          :RStop
" -----------------------------------------------------------
"
" Send
"   . File                                               \aa
"   . File (echo)                                        \ae
"   . File (open .Rout)                                  \ao
"   --------------------------------------------------------
"   . Block (cur)                                        \bb
"   . Block (cur, echo)                                  \be
"   . Block (cur, down)                                  \bd
"   . Block (cur, echo and down)                         \ba
"   --------------------------------------------------------
"   . Chunk (cur)                                        \cc
"   . Chunk (cur, echo)                                  \ce
"   . Chunk (cur, down)                                  \cd
"   . Chunk (cur, echo and down)                         \ca
"   . Chunk (from first to here)                         \ch
"   --------------------------------------------------------
"   . Function (cur)                                     \ff
"   . Function (cur, echo)                               \fe
"   . Function (cur and down)                            \fd
"   . Function (cur, echo and down)                      \fa
"   --------------------------------------------------------
"   . Selection                                          \ss
"   . Selection (echo)                                   \se
"   . Selection (and down)                               \sd
"   . Selection (echo and down)                          \sa
"   . Selection (evaluate and insert output in new tab)  \so
"   --------------------------------------------------------
"   . Send motion region                                 \m{motion}
"   --------------------------------------------------------
"   . Paragraph                                          \pp
"   . Paragraph (echo)                                   \pe
"   . Paragraph (and down)                               \pd
"   . Paragraph (echo and down)                          \pa
"   --------------------------------------------------------
"   . Line                                                \l
"   . Line (and down)                                     \d
"   . Line (and new one)                                  \q
"   . Left part of line (cur)                       \r<Left>
"   . Right part of line (cur)                     \r<Right>
"   . Line (evaluate and insert the output as comment)    \o
"   . All lines above the current one                    \su
" -----------------------------------------------------------
"
" Command
"   . List space                                         \rl
"   . Clear console                                      \rr
"   . Remove objects and clear console                   \rm
"   --------------------------------------------------------
"   . Print (cur)                                        \rp
"   . Names (cur)                                        \rn
"   . Structure (cur)                                    \rt
"   . View data.frame (cur) in new tab                   \rv
"   . View data.frame (cur) in horizontal split          \vs
"   . View data.frame (cur) in vertical split            \vv
"   . View head(data.frame) (cur) in horizontal split    \vh
"   . Run dput(cur) and show output in new tab           \td
"   . Run print(cur) and show output in new tab          \tp
"   --------------------------------------------------------
"   . Arguments (cur)                                    \ra
"   . Example (cur)                                      \re
"   . Help (cur)                                         \rh
"   --------------------------------------------------------
"   . Summary (cur)                                      \rs
"   . Plot (cur)                                         \rg
"   . Plot and summary (cur)                             \rb
"   --------------------------------------------------------
"   . Set working directory (cur file path)              \rd
"   --------------------------------------------------------
"   . Sweave (cur file)                                  \sw
"   . Sweave and PDF (cur file)                          \sp
"   . Sweave, BibTeX and PDF (cur file) (Linux/Unix)     \sb
"   --------------------------------------------------------
"   . Knit (cur file)                                    \kn
"   . Knit, BibTeX and PDF (cur file) (Linux/Unix)       \kb
"   . Knit and PDF (cur file)                            \kp
"   . Knit and Beamer PDF (cur file)                     \kl
"   . Knit and HTML (cur file, verbose)                  \kh
"   . Knit and ODT (cur file)                            \ko
"   . Knit and Word Document (cur file)                  \kw
"   . Markdown render (cur file)                         \kr
"   . Spin (cur file) (only .R)                          \ks
"   --------------------------------------------------------
"   . Open attachment of reference (Rmd, Rnoweb)         \oa
"   . Open PDF (cur file)                                \op
"   . Search forward (SyncTeX)                           \gp
"   . Go to LaTeX (SyncTeX)                              \gt
"   --------------------------------------------------------
"   . Build tags file (cur dir)                  :RBuildTags
" -----------------------------------------------------------
"
" Edit
"   . Insert "<-"                                          _
"   . Complete object name                     CTRL-X CTRL-O
"   --------------------------------------------------------
"   . Indent (line)                                       ==
"   . Indent (selected lines)                              =
"   . Indent (whole buffer)                             gg=G
"   --------------------------------------------------------
"   . Toggle comment (line, sel)                         \xx
"   . Comment (line, sel)                                \xc
"   . Uncomment (line, sel)                              \xu
"   . Add/Align right comment (line, sel)                 \;
"   --------------------------------------------------------
"   . Go (next R chunk)                                  \gn
"   . Go (previous R chunk)                              \gN
" -----------------------------------------------------------
"
" Object Browser
"   . Open/Close                                         \ro
"   . Expand (all lists)                                 \r=
"   . Collapse (all lists)                               \r-
"   . Toggle (cur)                                     Enter
" -----------------------------------------------------------
"
" Help (plugin)
" Help (R)                                            :Rhelp
" -----------------------------------------------------------

" Disable `_` to `<-`, which is ridiculous.
" > let vimrplugin_assign = 0
" https://stackoverflow.com/questions/44529713
let R_assign = 0


" airline                                                                   {{{2
" ------------------------------------------------------------------------------

" Consider adding tmuxline integration.
" https://github.com/edkolev/tmuxline.vim

" Tab line.
" > let g:airline#extensions#tabline#enabled = 1
" > let g:airline#extensions#tabline#formatter = 'default'
" > let g:airline#extensions#tabline#left_alt_sep = '|'
" > let g:airline#extensions#tabline#left_sep = ' '


" jedi-vim                                                                  {{{2
" ------------------------------------------------------------------------------

" This plugin freaks out in an active conda environment. Edit Python scripts
" using spacemacs instead.

" > let g:jedi#auto_vim_configuration = 1
" > let g:jedi#completions_enabled = 0
" > let g:jedi#popup_on_dot = 0
" > let g:jedi#popup_select_first = 1
" > let g:jedi#show_call_signatures = 1
" > let g:jedi#use_splits_not_buffers = "left"
" > let g:jedi#use_tabs_not_buffers = 1
let g:jedi#auto_initialization = 0

" syntastic                                                                 {{{2
" ------------------------------------------------------------------------------

" Check which linters are enabled with `:SyntasticInfo`.
" Check PATH with `:echo syntastic#util#system('echo "$PATH"')`.

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" > let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python
" > let g:syntastic_python_checkers = ['flake8']
" > let g:syntastic_python_checkers = ['pylint']

" R
" https://github.com/jimhester/lintr
" This can be slow to load, so disable by default.
" > let g:syntastic_enable_r_lintr_checker = 1
" > let g:syntastic_r_checkers = ['lintr']
" > let g:syntastic_r_lintr_linters = 'with_defaults(object_name_linter("camelCase"))'



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
