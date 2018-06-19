scriptencoding utf-8

"-----------------------------
" Text, Markdown
"-----------------------------

" Remove space at end of line ( exception: markdown, text )
autocmd vimrc BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif

autocmd vimrc FileType text,markdown setlocal ambiwidth=double wrap display=lastline



"-----------------------------
" Vim script
"-----------------------------

autocmd vimrc BufNewFile,BufRead vimrc,gvimrc,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2


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
  setlocal foldmethod=indent
  setlocal foldlevel=1
  setlocal foldminlines=3
endfunction


"-----------------------------
" Python
"-----------------------------

autocmd vimrc BufRead,BufNewFile *.pdbrc setfiletype python
