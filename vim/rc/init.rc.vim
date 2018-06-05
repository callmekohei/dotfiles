scriptencoding utf-8
"---------------------------------------------------------------------------
" Reference:
" koron/vim-kaoriya      : https://github.com/koron/vim-kaoriya/blob/master/kaoriya/vim
" Shougo/shougo-s-github : https://github.com/Shougo/shougo-s-github/blob/master/vim

"---------------------------------------------------------------------------
" Use English interface.
"
language message C

"---------------------------------------------------------------------------
" Encoding:
"
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

"---------------------------------------------------------------------------
" Disable default plugins
"
if has('gui_running')
    set guioptions=Mc
endif
let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1
