scriptencoding utf-8

" exchange colon and semi-colon
nnoremap  ; :


" Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
if has('mac')
  set iskeyword=@,48-57,_,128-167,224-235
endif


