"---------------------------------------------------------------------------
" Search:
"
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

"---------------------------------------------------------------------------
" Edit:
"

" Mouse ( see :help mouse-using )
set mouse=nvic

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent smartindent

" Disable modeline.
set modelines=0
set nomodeline

" Use clipboard register.
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
     set clipboard& clipboard+=unnamedplus
  else
     set clipboard& clipboard+=unnamed
  endif
endif

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Display another buffer when current buffer isn't saved.
set hidden

" Enable folding.
set foldenable
set foldmethod=indent

" Show folding level.
set foldcolumn=1
set fillchars=vert:\|
set commentstring=%s

" Enable virtualedit in visual block mode.
set virtualedit=block

"---------------------------------------------------------------------------
" View:
"

" Color scheme
set background=dark
colorscheme Apprentice

" Show line number.
set number

" Show <TAB> and <CR>
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%

" Always display statusline.
set laststatus=2

" Height of command line.
set cmdheight=2

" Not show command on statusline.
set noshowcmd

" Disable tabline.
set showtabline=0

" Turn down a long line appointed in 'breakat'
set linebreak
set showbreak=\
set breakat=\ \	;:,!?

set nowrap

" Do not display the greetings message at the time of Vim start.
" set shortmess=aTI

" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

" Disable bell.
set t_vb=
set novisualbell
set belloff=all

" Display candidate supplement.
set wildmenu

" Maintain a current line at the time of movement as much as possible.
set nostartofline

" Splitting a window will put the new window below the current one.
set splitbelow

" Splitting a window will put the new window right the current one.
set splitright

" Adjust window size of preview and help.
" set previewheight=8
" set helpheight=12

set ttyfast

" When a line is long, do not omit it in @.
set display=lastline

