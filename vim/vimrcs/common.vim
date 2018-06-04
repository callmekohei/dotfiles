" Encoding
if &encoding !=# "utf-8"
    set encoding=utf-8
endif
scriptencoding utf-8

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
" sdbのときは表示が崩れる
" set ambiwidth=double " □や○文字が崩れる問題を解決

colorscheme Apprentice

set splitright

" Security
set modelines=0

" Set to auto read when a file is changed from the outside
"set autoread

" Show line numbers
set number

" Not wrap text
set nowrap

" Status bar
set laststatus=2
set ruler
set showmode
set showcmd

" Command line
set cmdheight=2
set wildmenu



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
" set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
" set showmatch
set wrapscan

" " Folding TODO
set foldmethod=marker
" set foldmethod=syntax
" let perl_fold=1
" set foldlevel=100 "Don't autofold anything

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

