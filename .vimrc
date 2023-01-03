syntax enable
filetype plugin indent on

call plug#begin()
	Plug 'rust-lang/rust.vim'
	Plug 'rhysd/vim-clang-format'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

let g:rustfmt_autosave = 1
let g:clang_format#auto_format = 1
let g:clang_format#detect_style_file = 0
" clang-format >= v14.0
let g:clang_format#style_options = {
	\ "AlignArrayOfStructures": "None",
	\ "AlignConsecutiveAssignments": "AcrossEmptyLinesAndComments",
	\ "AlignConsecutiveBitFields": "AcrossEmptyLinesAndComments",
	\ "AlignConsecutiveDeclarations": "AcrossEmptyLinesAndComments",
	\ "AlignConsecutiveMacros": "AcrossEmptyLinesAndComments",
	\ "AlignOperands": "true",
	\ "AllowShortBlocksOnASingleLine": "Empty",
	\ "AllowShortEnumsOnASingleLine": "false",
	\ "AllowShortFunctionsOnASingleLine": "Empty",
	\ "AllowShortIfStatementsOnASingleLine": "false",
	\ "BasedOnStyle": "LLVM",
	\ "BreakBeforeBraces": "Linux",
	\ "IndentCaseLabels": "false",
	\ "IndentWidth": "8",
	\ "UseTab": "Always",
	\ }
" clang-format < v14.0
" let g:clang_format#style_options = {
" 	\ "AlignConsecutiveAssignments": "true",
" 	\ "AlignConsecutiveDeclarations": "true",
" 	\ "AlignConsecutiveMacros": "true",
" 	\ "AlignOperands": "true",
" 	\ "AllowShortBlocksOnASingleLine": "Empty",
" 	\ "AllowShortFunctionsOnASingleLine": "Empty",
" 	\ "AllowShortIfStatementsOnASingleLine": "false",
" 	\ "BasedOnStyle": "LLVM",
" 	\ "BreakBeforeBraces": "Linux",
" 	\ "IndentCaseLabels": "false",
" 	\ "IndentWidth": "8",
" 	\ "UseTab": "Always",
" 	\ }

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
cmap w!! w !sudo tee > /dev/null %

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
