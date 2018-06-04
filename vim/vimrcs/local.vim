" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Remove space at end of line ( exception: markdown, text )
autocmd BufWritePre * if index(['markdown','text'], &ft)==-1 | :%s/\s\+$//e | endif


" Adjust hight of QuickFix window
" code from : https://gist.github.com/juanpabloaj/5845848#file-adjustwindowheight-vim
autocmd FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction


augroup bash
    autocmd!
    " see also: :help ft-sh-syntax
    autocmd FileType sh let g:is_bash = 1
    autocmd FileType sh let g:sh_no_error = 1

    if exists('g:quickrun_config.bashCheck')
        autocmd FileType sh let &errorformat = '%f:\ line\ %l:\ %m'
        autocmd BufWinEnter  *.bash  call quickrun#run( g:quickrun_config.bashCheck )
        autocmd BufWritePost *.bash  call quickrun#run( g:quickrun_config.bashCheck )
    endif
augroup END


set rtp+=/usr/local/opt/fzf


autocmd BufRead,BufNewFile *.pdbrc setfiletype python

command! -buffer Dotfiles    : edit $HOME/dotfiles
command! -buffer Vimrc       : edit $HOME/dotfiles/vim/vimrcs/common.vim
command! -buffer Vimlocalrc  : edit $HOME/dotfiles/vim/vimrcs/local.vim
command! -buffer Bashrc      : edit $HOME/dotfiles/bash/.bashrc
command! -buffer Bashlocalrc : edit $HOME/dotfiles/bash/local.bash
command! -buffer Deinrc      : edit $HOME/dotfiles/vim/vimrcs/dein.toml
command! -buffer Deinlazyrc  : edit $HOME/dotfiles/vim/vimrcs/deinlazy.toml
command! -buffer Memo        : edit $HOME/tmp/memo.txt

call textobj#user#plugin('yyy', {} )
call textobj#user#plugin('yyy', {
\   'bbb': {
\     'pattern': ["^hook.* = '''","^'''"],
\     'select-a': 'aP',
\     'select-i': 'iP',
\   },
\ })



" \   'ccc': {
" \     'pattern': [".*{{{$",".*}}}$"],
" \     'select-a': 'aP',
" \     'select-i': 'iP',
" \   },



