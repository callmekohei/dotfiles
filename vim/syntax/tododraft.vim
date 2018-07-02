syntax match foo "vim:.*$"
syntax match lineComments "//.*$"
syntax region blockComments start="(\*" end="\*)"
syntax keyword todo TODO FIXME XXX NOTE
syntax match titelKeywords "^.*\ze\s*{{{"
syntax match startBraces "{{{"
syntax match endBraces   "}}}"
highlight link foo Comment
highlight link lineComments Comment
highlight link blockComments Comment
highlight link todo Todo
highlight link titelKeywords Statement
highlight link startBraces Comment
highlight link endBraces Comment
let b:current_syntax = 'text.tododraft'
