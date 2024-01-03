syntax enable
filetype plugin indent on

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
" remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
" jump to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
lang en_US.UTF-8

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
	autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
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
    " Replace mode
    let &t_SR .= "\e[4 q"
endif


" Plugins
call plug#begin()
	Plug 'rust-lang/rust.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'mechatroner/rainbow_csv'
	Plug 'keaising/im-select.nvim'
	if has ('nvim')
		Plug 'echasnovski/mini.nvim'
	else
		Plug 'cohama/lexima.vim'
	endif
call plug#end()

let g:copilot_filetypes = {'yaml': v:true}
let g:copilot_filetypes = {'markdown': v:true}

let g:rustfmt_autosave = 1

if has ('nvim')
"""""""""""""""""""""""""""""
""" BEGINING_OF_LUA_BLOCK """
lua <<EOF
local os_name = vim.loop.os_uname().sysname

if os_name == 'Linux' then
require('im_select').setup {
    default_im_select  = "keyboard-jp",
    default_command = 'fcitx5-remote',
    set_default_events = { "VimEnter", "FocusGained", "InsertLeave" },
    set_previous_events = {},
    keep_quiet_on_no_binary = false,
    async_switch_im = true
}
elseif os_name == "Darwin" then
require('im_select').setup {
    default_im_select  = "com.apple.keylayout.ABC",
    default_command = 'im-select-nano',
    set_default_events = { "VimEnter", "FocusGained", "InsertLeave" },
    set_previous_events = {},
    keep_quiet_on_no_binary = false,
    async_switch_im = true
}
end

require('mini.comment').setup()
require('mini.pairs').setup()
EOF
""" END_OF_LUA_BLOCK """
""""""""""""""""""""""""
endif

