"==================
" File encode utf-8
set fenc=utf-8
" backup fileを作らない
set nobackup
" swap fileを作らない
set noswapfile
" ファイルの変更時に自動で読み込む
set autoread
" バッファが編集中でも他のファイルを開ける
set hidden
set showcmd
language C


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
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent

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
inoremap () ()
inoremap (<Enter> ()<left><CR><ESC><S-o>

inoremap { {}<left>
inoremap {} {}
inoremap {<Enter> {}<left><CR><ESC><S-o>

inoremap [ []<left>
inoremap [] []
inoremap [<Enter> []<left><CR><ESC><S-o>

inoremap ' ''<left>
inoremap '' ''

inoremap " ""<left>
inoremap "" ""

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

"=======
" scroll
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=5

