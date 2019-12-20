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
" 入力中のコマンドをステータスに表示
set showcmd
" Japanese => English
language C



" 行数の表示
set number
" 現在の行を強調表示
set cursorline
" 行末にカーソルを置ける
set virtualedit=onemore
" 
set smartindent
" カッコの対応を強調
set showmatch



" Highlight
syntax enable


" インデント，タブ
" タブスペース
set expandtab



" Search
" 検索文字列が小文字=>大文字小文字の区別なし
set ignorecase
" 検索文字列が大文字=>大文字小文字の区別あり
set smartcase
" 
set incsearch
" 
set wrapscan
" 
set hlsearch

