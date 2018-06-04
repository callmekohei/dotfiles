if &compatible
  set nocompatible
endif

if executable('brew')
    if has('nvim')
        :silent let s:brewHome = systemlist('brew --prefix')
        let g:python_host_prog  = s:brewHome[0].'/bin/python2'
        let g:python3_host_prog = s:brewHome[0].'/bin/python3'
    endif
endif

execute 'source' '~/dotfiles/vim/vimrcs/plugins.vim'
execute 'source' '~/dotfiles/vim/vimrcs/common.vim'
execute 'source' '~/dotfiles/vim/vimrcs/keymap.vim'
execute 'source' '~/dotfiles/vim/vimrcs/local.vim'
