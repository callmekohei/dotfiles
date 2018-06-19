scriptencoding utf-8

"-----------------------------
" Text, Markdown
"-----------------------------

" Remove space at end of line ( exception: markdown, text )
autocmd vimrc BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif

autocmd vimrc BufNewFile,BufRead * call s:foo()

function! s:foo() abort
  if &filetype == 'text' || &filetype == 'markdown'
  setlocal ambiwidth=double
  endif
endfunction


"-----------------------------
" Vim script
"-----------------------------

autocmd vimrc BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2


"-----------------------------
" QuickFix
"-----------------------------

" code from : https://gist.github.com/juanpabloaj/5845848#file-adjustwindowheight-vim
autocmd vimrc FileType qf call AdjustWindowHeight(3, 10)

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


"-----------------------------
" Bash script
"-----------------------------

" see also: :help ft-sh-syntax
autocmd vimrc FileType sh let g:is_bash = 1
autocmd vimrc FileType sh let g:sh_no_error = 1

if exists('g:quickrun_config.bashCheck')
  autocmd vimrc FileType sh let &errorformat = '%f:\ line\ %l:\ %m'
  autocmd vimrc BufWinEnter  *.bash  call quickrun#run( g:quickrun_config.bashCheck )
  autocmd vimrc BufWritePost *.bash  call quickrun#run( g:quickrun_config.bashCheck )
endif


"-----------------------------
" F#
"-----------------------------

autocmd vimrc BufNewFile,BufRead *.dependencies setlocal filetype=dependencies

autocmd vimrc BufNewFile,BufRead *.fs,*.fsi,*.fsx call s:fsharpSettings()
function! s:fsharpSettings() abort
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal foldmethod=indent
  setlocal foldlevel=1
  setlocal foldminlines=3
endfunction

if exists('g:quickrun_config.fsharpCheck')
  augroup fsharpCheck

    let s:err     = '%f(%l\,%c):\ %m'
    let s:blank01 = '%-G %.%#'
    let s:blank02 = '%-G'
    let s:invalid = '%-G%[%^/]%.%#'

    let s:lst = [ s:err, s:blank01, s:blank02, s:invalid ]

    autocmd!
    autocmd FileType fsharp let &errorformat = join( s:lst , ',' )

    " see also:
    " quick-run can not execute well at vim's launch. #175
    " https://github.com/thinca/vim-quickrun/issues/175
    if has('nvim') || has('gui_running')
      autocmd BufWinEnter *.fsx  call quickrun#run( g:quickrun_config.fsharpCheck )
    endif
    autocmd BufWritePost *.fsx  call quickrun#run( g:quickrun_config.fsharpCheck )
  augroup end
endif


"-----------------------------
" Python
"-----------------------------

autocmd vimrc BufRead,BufRead,BufNewFile *.pdbrc setfiletype python
