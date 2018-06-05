scriptencoding utf-8
"---------------------------------------------------------------------------
" callmekohei's quickrun.rc.vim
"

let g:quickrun_config = {}

let g:quickrun_config._ = {
    \  'runner'                          : 'vimproc'
    \ ,'runner/vimproc/updatetime'       : 60
    \ ,'hook/time/enable'                : 1
    \ ,'hook/time/format'                : "\n*** time : %g s ***"
    \ ,'hook/time/dest'                  : ''
    \ ,"outputter/buffer/split"          : 'vertical'
    \ ,'outputter/buffer/close_on_empty' : 1
\}

let g:quickrun_config.sh = {
    \ 'command': 'bash'
\}

let g:quickrun_config.bashCheck = {
    \  'exec'                            : [ '%c -n %s:p:r.bash' ]
    \ ,'command'                         : 'bash'
    \ ,'hook/time/enable'                : 0
    \ ,"outputter/buffer/close_on_empty" : 1
    \ ,"outputter"                       : 'quickfix'
    \ ,'outputter/buffer/split'          : ':set splitblow',
\}

let g:quickrun_config.fsharp = {
    \  'command'                         : 'fsharpi --readline-'
    \ ,'runner'                          : 'concurrent_process'
    \ ,'runner/concurrent_process/load'  : '#load "%S";;'
    \ ,'runner/concurrent_process/prompt': '> '
\}

let g:quickrun_config.fsharpCheck = {
    \  'command'                         : 'fsharpi --readline-'
    \ ,'runner'                          : 'concurrent_process'
    \ ,'runner/concurrent_process/load'  : '#load "%S";;'
    \ ,'runner/concurrent_process/prompt': '> '
    \ ,'hook/time/enable'                : 0
    \ ,"outputter/buffer/close_on_empty" : 1
    \ ,"outputter"                       : 'quickfix'
    \ ,'outputter/buffer/split'          : ':set splitblow',
\}

let g:quickrun_config.fsharpi = {
    \  'exec'   :  [ '%c %s:p:r.fsx' ]
    \ ,'command':  'fsharpi'
    \ ,'args'   :  '%{input("args> ")}'
\}

let g:quickrun_config.python = {
    \ 'command': 'python3'
\}

