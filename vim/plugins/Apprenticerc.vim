"see also: https://github.com/romainl/Apprentice#tweaking-apprentice
function! MyHighlights() abort
    highlight Comment ctermfg=245
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
