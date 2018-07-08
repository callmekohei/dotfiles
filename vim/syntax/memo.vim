" memo syntax highlight

" settings
syntax match settings "vim:.*$"

" comment
syntax match  lineComment "//.*$"
syntax region blockComment start="(\*" end="\*)"
syntax region blockComment2 start="```" end="```"

" todo
syntax keyword todo TODO FIXME XXX NOTE

" folding brace
syntax match startBraces "\({{{\d\|{{{\)"
syntax match endBraces   "\(}}}\d\|}}}\)"

" folding headline ( "tailTitle: \zs do not work well :-(
syntax match headTitle "^.*\ze\s*{{{.*"
syntax match tailTitle "\%(\(}}}\d\|}}}\)\s*\)\@<=\([a-zA-Z.]\|-.*\)\+"

highlight link settings      Comment
highlight link lineComment   Comment
highlight link blockComment  Comment
highlight link blockComment2 String
highlight link todo          Todo
highlight link startBraces   Comment
highlight link endBraces     Comment
highlight link headTitle     Statement
highlight link tailTitle     Statement

let b:current_syntax = 'memo'
