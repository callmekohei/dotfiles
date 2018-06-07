scriptencoding utf-8

command! -buffer Dotfiles    : edit $HOME/dotfiles
command! -buffer Vimrc       : edit $HOME/dotfiles/vim/rc/local.rc.vim
command! -buffer Bashrc      : edit $HOME/dotfiles/bash/local.bash
command! -buffer Deinrc      : edit $HOME/dotfiles/vim/rc/dein/dein.toml
command! -buffer Memo        : edit $HOME/tmp/memo.txt

" TODO: 後で調べる
" https://qiita.com/sgur/items/aa443bc2aed6fe0eb138
" Neovimではうごかない・・・
" set iminsert=2
" set imsearch=2
" set imcmdline
" set imactivatefunc=ImActivate
" function! ImActivate(active)
"   if a:active
"     call system('fcitx-remote -o')
"   else
"     call system('fcitx-remote -c')
"   endif
" endfunction
" set imstatusfunc=ImStatus
" function! ImStatus()
"   return system('fcitx-remote')[0] is# '2'
" endfunction
