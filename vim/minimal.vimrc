" Your minimal init.vim/vimrc
set runtimepath+=~/dotfiles/vim/pack/pack1/start/deoplete.nvim/
set runtimepath+=~/dotfiles/vim/pack/pack1/start/deoplete-fsharp/

autocmd VimEnter * call s:foo()

  function s:foo() abort

    " deoplet-fsharp(deopletefs needs no member.py)
    call deoplete#custom#option({
      \   'auto_refresh_delay' : 20
      \ , 'min_pattern_length' : 999
      \ , 'ignore_case'        : v:true
      \ , 'refresh_always'     : v:false
      \ , 'ignore_sources' : {'fsharp':['member']}
    \ })

    call deoplete#enable() " <--- right position!!

  endfunction
