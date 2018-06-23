scriptencoding utf-8

augroup aufsharp
  autocmd!
augroup END

autocmd aufsharp FileType fsharp call s:vimrc_fsharp()

function! s:vimrc_fsharp() abort
  let &errorformat = '%f(%l\,%c):\ %m,%-G %.%#,%-G,%-G%[%^/]%.%#'
  setlocal previewheight=5
  setlocal nosplitbelow
  setlocal foldmethod=indent
  setlocal foldlevel=1
  setlocal foldminlines=3
endfunction

"-------------------------
" Setting for QuickRun
"-------------------------

if has('mac')
  let s:command = 'fsharpi --readline-'
elseif has('win32')
  let s:command = 'fsi'
else
  let s:command = 'fsharpi'
endif

let g:quickrun_config.fsharp = {
  \  'command'                          : s:command
  \ ,'runner'                           : 'concurrent_process'
  \ ,'runner/concurrent_process/load'   : '#load "%S";;'
  \ ,'runner/concurrent_process/prompt' : '> '
  \ ,'hook/time/format'                 : "\n*** time : %g s ***"
  \ ,'hook/time/dest'                   : ''
  \ ,"outputter/buffer/split"           : 'vertical'
\}

let g:quickrun_config.fsharpCheck = {
  \  'command'                          : s:command
  \ ,'runner'                           : 'concurrent_process'
  \ ,'runner/concurrent_process/load'   : '#load "%S";;'
  \ ,'runner/concurrent_process/prompt' : '> '
  \ ,'hook/time/enable'                 : 0
  \ ,"outputter/buffer/close_on_empty"  : 1
  \ ,"outputter"                        : 'quickfix'
  \ ,'outputter/buffer/split'           : ':set splitblow',
\}

let g:quickrun_config.fsharpi = {
  \  'exec'    : [ '%c %s:p:r.fsx' ]
  \ ,'command' : 'fsharpi'
  \ ,'args'    : '%{input("args> ")}'
\}

" see also: quick-run can not execute well at vim's launch. #175
" https://github.com/thinca/vim-quickrun/issues/175
if has('nvim') || has('gui_running')
  autocmd aufsharp BufWinEnter  *.fsx call quickrun#run( g:quickrun_config.fsharpCheck )
  autocmd aufsharp BufWritePost *.fsx call quickrun#run( g:quickrun_config.fsharpCheck )
else
  autocmd aufsharp BufWritePost *.fsx call quickrun#run( g:quickrun_config.fsharpCheck )
endif
