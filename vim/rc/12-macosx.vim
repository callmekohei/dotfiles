scriptencoding utf-8

" exchange colon and semi-colon
nnoremap ; :
nnoremap : ;
inoremap ; :
inoremap : ;
vnoremap ; :
vnoremap : ;
cnoremap ; :
cnoremap : ;

" Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
set iskeyword=@,48-57,_,128-167,224-235


