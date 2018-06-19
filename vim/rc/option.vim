scriptencoding utf-8

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
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab
set autoindent "smartindent
set backspace=indent,eol,start
set noshowmatch
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" View:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set noruler
" タブや改行を非表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示（noshowcmd；非表示）
set noshowcmd
" タイトルを表示
set title
" Color scheme（MacVim使用時はgvimrcを編集すること）
set background=dark
colorscheme Apprentice

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.


"---------------------------------------------------------------------------
" マウスに関する設定:
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set nomousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

"---------------------------------------------------------------------------
" Clipboard:
"
" Use clipboard register.
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
  else
    set clipboard& clipboard+=unnamed
  endif
endif


"---------------------------------------------------------------------------
" Others:
"

" stop rendering duraing command executing
" set lazyredraw

" Display another buffer when current buffer isn't saved.
set hidden

" Disable tabline.
" set showtabline=0

" Turn down a long line appointed in 'breakat'
" set linebreak
" set showbreak=\
" set breakat=\ \ ;:,!?

" Disable bell.
" set t_vb=
" set novisualbell
" set belloff=all

" Maintain a current line at the time of movement as much as possible.
" set nostartofline

" Splitting a window will put the new window below the current one.
set splitbelow

" Splitting a window will put the new window right the current one.
set splitright

" Adjust window size of preview and help.
" set previewheight=8
" set helpheight=12

" fast mouse scroll
set ttyfast

" When a line is long, do not omit it in @.
" set display=lastline

" Enable virtualedit in visual block mode.
" set virtualedit=block

" Disable modeline.
" set modelines=0
" set nomodeline
