" vim:set foldmethod=marker:

let s:current_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Initialize {{{

    if &compatible
      set nocompatible
    endif

    " filetype off

    " Load plugins
    execute 'source' s:current_dir.'/loadplg.vim'

    " turn plugins on
    syntax on
    filetype plugin indent on
"}}}

"  Basic setting {{{

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
" sdbのときは表示が崩れる
" set ambiwidth=double " □や○文字が崩れる問題を解決

colorscheme Apprentice

" leader key
" let mapleader = ","

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
" set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
" set showmatch
set wrapscan

" code from practical vim (jp) p277
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR><C-l>
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

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

"}}}

"  Util command {{{

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove space at end of line ( exception: markdown, text )
autocmd BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif

"}}}

"  Util keymap {{{

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Formatting
map <leader>q gqip

" Windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" buffers TODO
set hidden
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" ---> :Explore
" " Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" }}}

"  Load local setting
execute 'source' s:current_dir.'/vimlocalrc.vim'
