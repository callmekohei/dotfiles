" ===========================================================================
"  FILE    : init.vim
"  AUTHOR  : callmekohei <callmekohei at gmail.com>
" ===========================================================================

if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

"----------------------------------------------------------
" Variables or path
"----------------------------------------------------------

if has('nvim')
    let g:python_host_prog  = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

set rtp+=/usr/local/opt/fzf


"----------------------------------------------------------
" Plugin manager
"----------------------------------------------------------

" see also: https://qiita.com/sugamondo/items/fcaf210ca86d65bcaca8
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml_dir = expand('~/.config/nvim')
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


"----------------------------------------------------------
" General
"----------------------------------------------------------

" Turn on plugin
filetype plugin indent on
syntax enable

" Appearance
colorscheme Apprentice

" auto indent
set autoindent
set smartindent

" Char code
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" Clipbord ( see : help clipboard )
set clipboard+=unnamed

" Folding TODO
" cancel folding
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything

" Mouse ( see :help mouse-using )
set mouse=nvic

" Search
set wrapscan
set ignorecase
nnoremap <silent> <C-l> :nohlsearch<CR>

" Tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" others
set nowrap
set number
set noswapfile
set cmdheight=2

" Vim8
if !has('nvim')
    " anvailable backspace
    set backspace=indent,eol,start

    " highlight search result
    set hlsearch

    " Looks like Neovim's statusline
    set laststatus=2
    set wildmenu
    set statusline=%f
    set statusline+=%m
    set statusline+=%r
    set statusline+=%h
    set statusline+=%w
    set statusline+=%=
    set statusline+=%l,%c\ \ \ \ \ \ \ \ \ \ \ \ %P
endif


"----------------------------------------------------------
" FileType behavior
"----------------------------------------------------------

" Remove space at end of line ( exception: markdown, text )
autocmd BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif

autocmd BufRead,BufNewFile *.pdbrc setfiletype python


"----------------------------------------------------------
" QuickFix
"----------------------------------------------------------

" Adjust hight of QuickFix window
" code from : https://gist.github.com/juanpabloaj/5845848#file-adjustwindowheight-vim
autocmd FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction


"----------------------------------------------------------
" Bash
"----------------------------------------------------------

augroup bash
    autocmd!
    " see also: :help ft-sh-syntax
    autocmd FileType sh let g:is_bash = 1
    autocmd FileType sh let g:sh_no_error = 1
    autocmd FileType sh let &errorformat = '%f:\ line\ %l:\ %m'
    autocmd BufWinEnter  *.bash  execute ":QuickRun bashCheck"
    autocmd BufWritePost *.bash  execute ":QuickRun bashCheck"
augroup END








"----------------------------------------------------------
" Temporary
"----------------------------------------------------------

nnoremap <Leader>. :<C-u>edit $MYVIMRC<CR>
command! -buffer Vimrc    : vsp $XDG_CONFIG_HOME/nvim/init.vim
command! -buffer Deinrc   : vsp $XDG_CONFIG_HOME/nvim/dein.toml
command! -buffer DeinLazy : vsp $XDG_CONFIG_HOME/nvim/dein_lazy.toml
command! -buffer Bashrc   : vsp $HOME/.bash_profile
