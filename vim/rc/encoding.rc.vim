scriptencoding utf-8

" Vimが内部処理に使用する文字コード
set encoding=utf-8
" 現在開いてるファイルの文字コード・保存時の文字コード
set fileencoding=utf-8
" Vimがファイルを開く際に試す文字コード・左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 端末の文字コード
if !has('gui_running') && &encoding != 'utf-8'
    set termencoding=utf-8
endif
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
