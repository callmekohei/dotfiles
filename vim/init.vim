let s:current_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

set nocompatible
filetype off

" Load plugins
execute 'source' s:current_dir.'/loadplg.vim'

" turn plugins on
syntax on
filetype plugin indent on


" ----------------------------------------------------------
" Basic setting
" ----------------------------------------------------------

colorscheme Apprentice

" leader key
let mapleader = ","

" Security
set modelines=0

" Set to auto read when a file is changed from the outside
set autoread

" Show line numbers
set number

" Wrap/noWrap text
" set wrap
set nowrap

" Status bar
set laststatus=2
set ruler
set showmode
set showcmd

" Command line
set cmdheight=2
set wildmenu

" Encoding
set encoding=utf-8

" Whitespace
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start

" Rendering
set ttyfast

" Searching
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set wrapscan
map <silent> <leader><cr> :noh<cr>

" Folding TODO
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything

" Turn backup off
set nobackup
set nowb
set noswapfile

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Clipbord ( see : help clipboard )
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
     set clipboard& clipboard+=unnamedplus
  else
     set clipboard& clipboard+=unnamed
  endif
endif

" Mouse ( see :help mouse-using )
set mouse=nvic


" ----------------------------------------------------------
" Utility command
" ----------------------------------------------------------
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove space at end of line ( exception: markdown, text )
autocmd BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif


" ----------------------------------------------------------
" Utility key map
" ----------------------------------------------------------
" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Formatting
map <leader>q gqip

" Windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l" load local setting

" buffers TODO
set hidden
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


" ----------------------------------------------------------
" Load loacal setting
" ----------------------------------------------------------
execute 'source' s:current_dir.'/local.vim'
