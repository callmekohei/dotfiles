scriptencoding utf-8

" Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
set iskeyword=@,48-57,_,128-167,224-235

" 事前にMac側でコロンとセミコロンをexchangeしておく
" echo '{ ";" = ("insertText:", ":"); ":" = ("insertText:", ";"); }' >> ~/Library/KeyBindings/DefaultKeyBinding.dict
