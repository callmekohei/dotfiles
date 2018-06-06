scriptencoding utf-8

let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

if has('vim_starting') && empty(argv())
    syntax off
endif

if exists('&inccommand')
    set inccommand=nosplit
endif
