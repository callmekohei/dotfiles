" Enable loggin
"call deoplete#enable_logging("DEBUG", "foo.txt")

let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'ignore_case': v:true,
\ })

call deoplete#custom#source('_',
\ 'converters', ['remove_overlap'])
