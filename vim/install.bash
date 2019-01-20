### --------------------------------------------------------
###                  git clone vim plugins
### --------------------------------------------------------

if [ ! -d pack/pack1/start/ ]; then
  mkdir -p pack/pack1/start
fi

cd pack/pack1/start

git clone https://github.com/tomtom/tcomment_vim
git clone https://github.com/romainl/Apprentice
git clone https://github.com/nathanaelkane/vim-indent-guides
git clone https://github.com/junegunn/vim-easy-align
git clone https://github.com/thinca/vim-quickrun
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/tpope/vim-fugitive

# SQL
git clone https://github.com/vim-scripts/dbext.vim
git clone https://github.com/vim-scripts/SQLUtilities
git clone https://github.com/vim-scripts/Align

# memolist( modified )
rm -rf memolist.vim
git clone https://github.com/callmekohei/memolist.vim
$(cd memolist.vim ; git checkout use_ctrlp)
pwd

# vb
git clone https://github.com/callmekohei/vbnet.vim
