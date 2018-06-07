scriptencoding utf-8

" TODO : 整理する！


" General {{{

" Remove space at end of line ( exception: markdown, text )
autocmd MyAutoCmd BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif


" }}}

" Quickfix {{{

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

" }}}

" Bash {{{
    " see also: :help ft-sh-syntax
    autocmd MyAutoCmd FileType sh let g:is_bash = 1
    autocmd MyAutoCmd FileType sh let g:sh_no_error = 1

    if exists('g:quickrun_config.bashCheck')
        autocmd MyAutoCmd FileType sh let &errorformat = '%f:\ line\ %l:\ %m'
        autocmd MyAutoCmd BufWinEnter  *.bash  call quickrun#run( g:quickrun_config.bashCheck )
        autocmd MyAutoCmd BufWritePost *.bash  call quickrun#run( g:quickrun_config.bashCheck )
    endif
augroup END
" }}}



" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Python {{{

autocmd MyAutoCmd BufRead,BufRead,BufNewFile *.pdbrc setfiletype python

" }}}

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
