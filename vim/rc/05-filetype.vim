scriptencoding utf-8

" TODO : 整理する！



" Remove space at end of line ( exception: markdown, text )
autocmd MyAutoCmd BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif

" TODO
" autocmd MyAutoCmd BufNewFile,BufRead * if index(['off','markdown','text'], &ft)==0 | set ambiwidth=double | endif
autocmd MyAutoCmd BufNewFile,BufRead *.txt set ambiwidth=double

"-----------------------------
" FileType
"-----------------------------
autocmd MyAutoCmd BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd MyAutoCmd BufNewFile,BufRead *.py  setlocal tabstop=4 softtabstop=4 shiftwidth=4



autocmd MyAutoCmd BufNewFile,BufRead *.dependencies setlocal filetype=dependencies
autocmd MyAutoCmd BufNewFile,BufRead *.dependencies setlocal tabstop=4 softtabstop=4 shiftwidth=4


autocmd MyAutoCmd BufNewFile,BufRead *.fs,*.fsi,*.fsx call s:fsharpSettings()
function! s:fsharpSettings() abort
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal foldmethod=indent
  setlocal foldlevel=1
  setlocal foldminlines=3
  " setlocal foldcolumn=2
  " setlocal foldignore=['if','else']
endfunction








" code from : https://gist.github.com/juanpabloaj/5845848#file-adjustwindowheight-vim
autocmd MyAutoCmd FileType qf call AdjustWindowHeight(3, 10)
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
    autocmd MyAutoCmd FileType sh let g:is_bash = 1
    autocmd MyAutoCmd FileType sh let g:sh_no_error = 1

    if exists('g:quickrun_config.bashCheck')
        autocmd MyAutoCmd FileType sh let &errorformat = '%f:\ line\ %l:\ %m'
        autocmd MyAutoCmd BufWinEnter  *.bash  call quickrun#run( g:quickrun_config.bashCheck )
        autocmd MyAutoCmd BufWritePost *.bash  call quickrun#run( g:quickrun_config.bashCheck )
    endif




" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


autocmd MyAutoCmd BufRead,BufRead,BufNewFile *.pdbrc setfiletype python


call textobj#user#plugin('yyy', {} )
call textobj#user#plugin('yyy', {
\   'bbb': {
\     'pattern': ["^hook.* = '''","^'''"],
\     'select-a': 'aP',
\     'select-i': 'iP',
\   },
\ })
" \   'ccc': {
" \     'pattern': [".*{{{$",".*}}}$"],
" \     'select-a': 'aP',
" \     'select-i': 'iP',
" \   },
