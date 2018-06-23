scriptencoding utf-8

" plugin setting
call textobj#user#plugin('yyy', {} )
call textobj#user#plugin('yyy', {
\ 'bbb': {
\ 'pattern': ["^hook.* = '''","^'''"],
\ 'select-a': 'aP',
\ 'select-i': 'iP',
\ },
\ })


command! Space2from4 call s:space4_to_space2()

function! s:space4_to_space2() abort
  set ts=4 sts=4 noet
  retab!
  set ts=2 sts=2 et
  retab
endfunction


command! Space4from2 call s:space2_to_space4()

function! s:space2_to_space4() abort
  set ts=2 sts=2 noet
  retab!
  set ts=4 sts=4 et
  retab
endfunction


" https://qiita.com/grohiro/items/e3dbcc93510bc8c4c812
let g:toggle_window_size = 0
function! ToggleWindowSize()
  if g:toggle_window_size == 1
    exec "normal \<C-w>="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
nnoremap M :call ToggleWindowSize()<CR>


" temporary commands
command! Dotfiles : edit $HOME/dotfiles
command! Vimrc    : edit $HOME/dotfiles/vim/rc/local.rc.vim
command! Bashrc   : edit $HOME/dotfiles/bash/local.bash
command! Deinrc   : edit $HOME/dotfiles/vim/rc/dein/dein.toml
command! Memo     : edit $HOME/tmp/memo_folder/memo.txt | : silent cd %:p:h | :silent pwd
