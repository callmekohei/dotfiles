scriptencoding utf-8

"----------------------------------------------------------
" Searching
"

" Cancel hilight search
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR><C-l>

" Search by selected word/sentence
" Practical Vim (ja) : https://pragprog.com/titles/dnvim/source_code
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction


"----------------------------------------------------------
" Moving
"

" Editor lines
nnoremap j gj
nnoremap k gk

" buffers
nnoremap <silent> <C-j> :bprevious<CR>
nnoremap <silent> <C-k> :bnext<CR>

" " Windows
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-h> <C-W>h
" nnoremap <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
