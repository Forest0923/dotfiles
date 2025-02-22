syntax enable
filetype plugin indent on
lang en_US.UTF-8

language C
set fenc=utf-8
set encoding=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
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
set backspace=indent,eol,start


" Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch


" map
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
highlight Search ctermfg=0 ctermbg=3
highlight CursorColumn ctermbg=8


" Shape of Cursor
"if &term =~ 'xterm\|rxvt'
if has('vim_starting')
    " Insert mode
    let &t_SI .= "\e[6 q"
    " Normal mode
    let &t_EI .= "\e[2 q"
endif

