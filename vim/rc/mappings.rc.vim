scriptencoding utf-8
"---------------------------------------------------------------------------
" callmekohei's mappings.rc
" Reference:
" Practical Vim (ja) : https://pragprog.com/titles/dnvim/source_code

"----------------------------------------------------------
" Searching
"
" Cancel hilight search
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR><C-l>

" Search by selected word/sentence
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

" Windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" buffers
nnoremap <silent> <C-j> :bprevious<CR>
nnoremap <silent> <C-k> :bnext<CR>
" nnoremap <silent> [b :bprevious<CR>
" nnoremap <silent> ]b :bnext<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
