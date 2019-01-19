cd $HOME/.vim/pack/pack1/start

git clone https://github.com/romainl/Apprentice
git clone https://github.com/nathanaelkane/vim-indent-guides
git clone https://github.com/junegunn/vim-easy-align
git clone https://github.com/thinca/vim-quickrun
git clone https://github.com/jonathanfilip/vim-lucius
git clone https://github.com/ctrlpvim/ctrlp.vim

# Git/Github
# git clone https://github.com/airblade/vim-gitgutter
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
