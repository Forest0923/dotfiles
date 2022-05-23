"==================
" File encode utf-8
set fenc=utf-8
set encoding=utf-8
" No backup file required
set nobackup
" No swap file required
set noswapfile
" Auto read when file is edited
set autoread
set hidden
set showcmd
language C
" bell off
set belloff=all
" Clipboard
set clipboard=unnamedplus
" mouse
set mouse=a


"=====
" line
set number
set cursorline
set virtualedit=onemore
set showmatch


"==========
" Highlight
syntax enable


"============
" Indent, Tab
set noexpandtab
set tabstop=8
set shiftwidth=8
set smarttab
set smartindent
if has ("autocmd")
	filetype plugin on
	autocmd FileType rust	setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd FileType python	setlocal tabstop=4 shiftwidth=4 expandtab
endif


"=======
" Search
" 検索文字列が小文字=>大文字小文字の区別なし
set ignorecase
" 検索文字列が大文字=>大文字小文字の区別あり
set smartcase
set incsearch
set wrapscan
set hlsearch


"========
" key map
inoremap ( ()<left>
inoremap (<right> (<right>
inoremap () ()
inoremap (<BS> (<BS>
inoremap (<Enter> ()<left><CR><BS><ESC><S-o>

inoremap { {}<left>
inoremap {<right> {<right>
inoremap {} {}
inoremap {<BS> {<BS>
inoremap {<Enter> {}<left><CR><BS><ESC><S-o>

inoremap [ []<left>
inoremap [<right> [<right>
inoremap [] []
inoremap [<BS> [<BS>
inoremap [<Enter> []<left><CR><BS><ESC><S-o>

inoremap ' ''<left>
inoremap '<right> '<right>
inoremap '<BS> '<BS>
inoremap '' ''

inoremap " ""<left>
inoremap "<right> "<right>
inoremap "<BS> "<BS>
inoremap "" ""

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk


"=======
" scroll
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set ttymouse=xterm2

"============
" ColorScheme
autocmd ColorScheme * hi CursorLine term=none cterm=bold ctermbg=none
autocmd ColorScheme * hi CursorLineNr term=bold cterm=bold ctermfg=yellow
if has('gui_running')
	colorscheme torte
else
	colorscheme default
endif
highlight Visual cterm=reverse ctermbg=none
highlight Search cterm=reverse ctermbg=none
"highlight Normal cterm=reverse ctermbg=none
"highlight NonText cterm=reverse ctermbg=none
