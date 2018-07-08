" memo syntax

let b:current_syntax = 'memo'

" settings
syntax match settings "vim:.*$"
highlight link settings Comment

" comment
syntax match lineComment "//.*$"
syntax region blockComment start="(\*" end="\*)"
syntax region blockComment2 start="```" end="```"
highlight link lineComment Comment
highlight link blockComment Comment
highlight link blockComment2 String

" todo
syntax keyword todo TODO FIXME XXX NOTE
highlight link todo Todo

" folding headline
syntax match titleKeywords "^.*\ze\s*{{{.*"
highlight link titleKeywords Statement
" TODO: do not make effect :-(
syntax match titleKeywords2 "^\s.*}}}\zsfoo"
highlight link titleKeywords2 Statement

" folding brace
syntax match startBraces "\%\({{{\d\|{{{\)"
highlight link startBraces Comment

syntax match endBraces  "\(}}}\d\|}}}\)"
highlight link endBraces Comment
