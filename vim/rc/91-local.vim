scriptencoding utf-8

command! -buffer Dotfiles  : edit $HOME/dotfiles
command! -buffer Vimrc     : edit $HOME/dotfiles/vim/rc/local.rc.vim
command! -buffer Bashrc    : edit $HOME/dotfiles/bash/local.bash
command! -buffer Deinrc    : edit $HOME/dotfiles/vim/rc/dein/dein.toml
command! -buffer Memo      : edit $HOME/tmp/memo_folder/memo.txt | : silent cd %:p:h | :silent pwd



command! -buffer Space2to4 call s:space4_to_space2()

function! s:space4_to_space2() abort
  set ts=4 sts=4 noet
  retab!
  set ts=2 sts=2 et
  retab
endfunction



" TODO: 後で調べる
" https://qiita.com/sgur/items/aa443bc2aed6fe0eb138
" Neovimではうごかない・・・
" set iminsert=2
" set imsearch=2
" set imcmdline
" set imactivatefunc=ImActivate
" function! ImActivate(active)
" if a:active
"   call system('fcitx-remote -o')
" else
"   call system('fcitx-remote -c')
" endif
" endfunction
" set imstatusfunc=ImStatus
" function! ImStatus()
" return system('fcitx-remote')[0] is# '2'
" endfunction


let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
