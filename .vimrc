syntax enable
filetype plugin indent on


"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
	Plug 'rust-lang/rust.vim'
	Plug 'rhysd/vim-clang-format'
call plug#end()

let g:rustfmt_autosave = 1
let g:clang_format#auto_format = 1

language C
set fenc=utf-8
set encoding=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set belloff=all
set clipboard=unnamedplus
set mouse=a
set wildmode=longest,list,full

" line
set number
set cursorline
set virtualedit=onemore
set showmatch

" Status Line
set statusline=%F
set statusline+=%m
set statusline+=%h
set statusline+=%=
set statusline+=\ %Y[%{&fileencoding}]
set statusline+=[%l/%L(%p%%)]
set laststatus=2

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


" Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch


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


" scroll
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
" set ttymouse=xterm2

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
