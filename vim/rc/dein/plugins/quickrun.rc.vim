scriptencoding utf-8

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

let g:quickrun_config.python = {
  \ 'command': 'python3'
\}
