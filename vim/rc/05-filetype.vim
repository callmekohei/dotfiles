scriptencoding utf-8

" TODO : 整理する！



" Remove space at end of line ( exception: markdown, text )
autocmd vimrc BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif

" TODO
" autocmd vimrc BufNewFile,BufRead * if index(['off','markdown','text'], &ft)==0 | set ambiwidth=double | endif
autocmd vimrc BufNewFile,BufRead *.txt set ambiwidth=double

"-----------------------------
" FileType
"-----------------------------
autocmd vimrc BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd vimrc BufNewFile,BufRead *.py  setlocal tabstop=4 softtabstop=4 shiftwidth=4



autocmd vimrc BufNewFile,BufRead *.dependencies setlocal filetype=dependencies
autocmd vimrc BufNewFile,BufRead *.dependencies setlocal tabstop=4 softtabstop=4 shiftwidth=4


autocmd vimrc BufNewFile,BufRead *.fs,*.fsi,*.fsx call s:fsharpSettings()
function! s:fsharpSettings() abort
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal foldmethod=indent
  setlocal foldlevel=1
  setlocal foldminlines=3
endfunction








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


" see also: :help ft-sh-syntax
autocmd vimrc FileType sh let g:is_bash = 1
autocmd vimrc FileType sh let g:sh_no_error = 1

if exists('g:quickrun_config.bashCheck')
  autocmd vimrc FileType sh let &errorformat = '%f:\ line\ %l:\ %m'
  autocmd vimrc BufWinEnter  *.bash  call quickrun#run( g:quickrun_config.bashCheck )
  autocmd vimrc BufWritePost *.bash  call quickrun#run( g:quickrun_config.bashCheck )
endif





autocmd vimrc BufRead,BufRead,BufNewFile *.pdbrc setfiletype python


call textobj#user#plugin('yyy', {} )
call textobj#user#plugin('yyy', {
\ 'bbb': {
\   'pattern': ["^hook.* = '''","^'''"],
\   'select-a': 'aP',
\   'select-i': 'iP',
\ },
\ })
" \   'ccc': {
" \   'pattern': [".*{{{$",".*}}}$"],
" \   'select-a': 'aP',
" \   'select-i': 'iP',
" \   },
