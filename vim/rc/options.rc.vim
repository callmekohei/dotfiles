scriptencoding utf-8

"---------------------------------------------------------------------------
" Search:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
set incsearch
set hlsearch

"---------------------------------------------------------------------------
" Edit:
"
" タブの画面上での幅
set tabstop=4 softtabstop=4 shiftwidth=4
" タブをスペースに展開する
set expandtab smarttab
" 自動的にインデントする
set autoindent "smartindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set noshowmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" Terminal_view:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set noruler
" タブや改行を非表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
" set listchars=tab:>-,extends:<,trail:-,eol:<
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
" プラットホーム依存の特別な設定
"
if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" Folding:
"
" Enable folding.
set foldenable
set foldmethod=indent
set foldmethod=marker
" Show folding level.
set foldcolumn=1
set fillchars=vert:\|
set commentstring=%s

"---------------------------------------------------------------------------
" Others:
"
" Mouse ( see :help mouse-using )
set mouse=nvic
" Use clipboard register.
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
    if has('unnamedplus')
        set clipboard& clipboard+=unnamedplus
    else
        set clipboard& clipboard+=unnamed
    endif
endif
" Display another buffer when current buffer isn't saved.
set hidden

"---------------------------------------------------------------------------
" Others2:
"

" Disable tabline.
" set showtabline=0

" Turn down a long line appointed in 'breakat'
" set linebreak
" set showbreak=\
" set breakat=\ \	;:,!?

" Disable bell.
" set t_vb=
" set novisualbell
" set belloff=all

" Maintain a current line at the time of movement as much as possible.
" set nostartofline

" Splitting a window will put the new window below the current one.
" set splitbelow

" Splitting a window will put the new window right the current one.
set splitright

" Adjust window size of preview and help.
" set previewheight=8
" set helpheight=12

" fast mouse scroll
" set ttyfast

" When a line is long, do not omit it in @.
" set display=lastline

" Enable virtualedit in visual block mode.
" set virtualedit=block

" Disable modeline.
" set modelines=0
" set nomodeline
