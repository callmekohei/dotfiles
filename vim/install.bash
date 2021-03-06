#!/usr/bin/env bash

### vim plugins

if [ ! -d pack/pack1/start/ ]; then
  mkdir -p pack/pack1/start
fi

cd pack/pack1/start

git clone https://github.com/tomtom/tcomment_vim
git clone https://github.com/romainl/Apprentice
git clone https://github.com/nathanaelkane/vim-indent-guides
git clone https://github.com/junegunn/vim-easy-align
git clone https://github.com/ctrlpvim/ctrlp.vim
# git clone https://github.com/tpope/vim-fugitive

# Quickrun
git clone https://github.com/thinca/vim-quickrun
git clone https://github.com/Shougo/vimproc.vim
$(cd vimproc.vim ; make)

# SQL
# git clone https://github.com/vim-scripts/dbext.vim
# git clone https://github.com/vim-scripts/SQLUtilities
# git clone https://github.com/vim-scripts/Align

# memolist( modified )
git clone https://github.com/callmekohei/memolist.vim
$(cd memolist.vim ; git checkout use_ctrlp)

# vb
git clone https://github.com/callmekohei/vbnet.vim

# markdown
git clone https://github.com/nelstrom/vim-markdown-folding
git clone https://github.com/previm/previm

# FSharp
git clone --depth 1 https://github.com/fsprojects/fsharp-language-server
$(cd fsharp-language-server
  wget 'https://raw.githubusercontent.com/fsharp/vim-fsharp/master/syntax/fsharp.vim' -P './syntax/'
  npm install
  dotnet build -c Release)
git clone --depth 1 https://github.com/autozimu/LanguageClient-neovim
$(cd LanguageClient-neovim ; git checkout next ; bash install.sh )
git clone --depth 1 https://github.com/Shougo/deoplete.nvim
git clone --depth 1 https://github.com/roxma/nvim-yarp
git clone --depth 1 https://github.com/roxma/vim-hug-neovim-rpc

### --------------------------------------------------------
###                      For AngularJS
### --------------------------------------------------------

### File explore
# git clone https://github.com/scrooloose/nerdtree
# git clone https://github.com/ryanoasis/vim-devicons
# git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

# git clone https://github.com/Shougo/defx.nvim
# git clone https://github.com/kristijanhusak/defx-icons
# git clone https://github.com/callmekohei/defx-icons

### TypeScript color syntax
git clone https://github.com/leafgarland/typescript-vim

### TypeScript ( based deoplete )
git clone https://github.com/Quramy/tsuquyomi
git clone https://github.com/rudism/deoplete-tsuquyomi

