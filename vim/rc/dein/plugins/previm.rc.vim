augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let s:url = "https://gist.githubusercontent.com/andyferra/2554919/raw/10ce87fe71b23216e3075d5648b8b9e56f7758e1/github.css"
let s:cssFolder = expand('~/.cache/dein/repos/github.com/kannokanno/previm/preview/css')

let g:previm_open_cmd = 'open -a Firefox'
let g:previm_enable_realtime = 1
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = s:cssFolder.'/github.css'

if !filereadable(s:cssFolder.'/github.css')
    execute '!wget' s:url '--directory-prefix' s:cssFolder
endif

