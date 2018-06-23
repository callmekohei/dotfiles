scriptencoding utf-8

" General {{{

  " Remove space at end of line ( exception: markdown, text )
  autocmd callmekohei-vimrc BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif

" }}}


" Text, Markdown {{{

  autocmd callmekohei-vimrc FileType text,markdown setlocal ambiwidth=double wrap display=lastline

" }}}


" Toml {{{

  autocmd callmekohei-vimrc FileType toml setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}


" Vim script {{{

  autocmd callmekohei-vimrc BufNewFile,BufRead vimrc,gvimrc setfiletype vim
  autocmd callmekohei-vimrc FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}


" QuickFix {{{

  " code from : https://gist.github.com/juanpabloaj/5845848#file-adjustwindowheight-vim
  autocmd callmekohei-vimrc FileType qf call AdjustWindowHeight(3, 10)
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


" Bash script {{{

  autocmd callmekohei-vimrc FileType sh call s:vimrc_bash()
  function! s:vimrc_bash() abort
    let g:is_bash = 1
    let g:sh_no_error = 1
    let &errorformat = '%f:\ line\ %l:\ %m'
  endfunction

  " quickrun settings
  let g:quickrun_config.sh = {}
  let g:quickrun_config.sh = { 'command': 'bash' }
  let g:quickrun_config.bashCheck = {}
  let g:quickrun_config.bashCheck = {
    \  'exec'                            : [ '%c -n %s:p:r.bash' ]
    \ ,'command'                         : 'bash'
    \ ,'hook/time/enable'                : 0
    \ ,"outputter/buffer/close_on_empty" : 1
    \ ,"outputter"                       : 'quickfix'
    \ ,'outputter/buffer/split'          : ':set splitblow',
  \}
  autocmd callmekohei-vimrc BufWinEnter,BufWritePost *.bash call quickrun#run( g:quickrun_config.bashCheck )

" }}}


" dependencies {{{

  autocmd callmekohei-vimrc BufNewFile,BufRead *.dependencies call s:vimrc_dependencies()
  function! s:vimrc_dependencies() abort
    setlocal filetype=dependencies
    setlocal dictionary+=~/tmp/mydictionary/foo_dictionary
  endfunction

" }}}


" Python {{{

  let g:quickrun_config.python = {}
  let g:quickrun_config.python = { 'command': 'python3' }
  autocmd callmekohei-vimrc BufRead,BufNewFile *.pdbrc setfiletype python

" }}}
