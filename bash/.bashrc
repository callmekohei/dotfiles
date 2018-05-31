echo 'load .bashrc'
#-------------------------------------------------------------
#  Go to Second Home Folder
#-------------------------------------------------------------

if [ ! -e $HOME/tmp/ ] ; then
    mkdir ./tmp/
fi
cd $HOME/tmp/


#-------------------------------------------------------------
#  Local
#-------------------------------------------------------------

export PYTHONPATH=~/pdb/
export SDB_PATH=~/sdbplg/bin/

alias loto6="( cd ~/myApp/lotofs/bin/ ; mono main_binary.exe)"
alias loto7="( cd ~/myApp/lotofs/bin/ ; mono main_binary.exe 7 )"

dotfiles     () { cd ~/dotfiles ; ls -al ; }
dotfileslink () { sh ~/dotfiles/dotfilesLink.sh ; echo 'update links' ; }
deopletefsharp () { cd ~/.cache/dein/repos/github.com/callmekohei/deoplete-fsharp ; }
bashrc () { vim ~/dotfiles/bash/.bashrc ; }
vimrc () { vim ~/dotfiles/vim/init.vim ; }
deinrc () { vim ~/dotfiles/vim/dein.toml ; }
deinlazyrc () { vim ~/dotfiles/vim/dein_lazy.toml; }

myapp () { cd ~/myApp ; ls -al ; }

export MONO_GAC_PREFIX=/usr/local
export WINEPREFIX=~/.wine
export XDG_CONFIG_HOME=~/.config
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --ansi'

eval "$(hub alias -s)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


