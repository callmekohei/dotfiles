# bashlocal.bash

#-------------------------------------------------------------
#  Local setting
#-------------------------------------------------------------

# second home {{{
    if [ ! -e $HOME/tmp/ ] ; then
        mkdir ./tmp/
    fi
    cd $HOME/tmp/
# }}}

# util alias {{{
    alias la='ls -a'
    alias ll='ls -a -l'
# }}}

# fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --ansi'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
f () { vim $(fzf) ; }

# git/github
eval "$(hub alias -s)"

export MONO_GAC_PREFIX=/usr/local
export WINEPREFIX=~/.wine
export XDG_CONFIG_HOME=~/.config


export PYTHONPATH=~/pdb/
export SDB_PATH=~/sdbplg/bin/
export SDB_PATH=~/myApp/sdbplg/bin/

alias loto6="( cd ~/myApp/lotofs/bin/ ; mono main_binary.exe)"
alias loto7="( cd ~/myApp/lotofs/bin/ ; mono main_binary.exe 7 )"
alias v='vim -N -u ~/tmp/code/essential.vim '

dotfile     () { cd ~/dotfiles ; ls -al ; }
dotfileslink () { sh ~/dotfiles/dotfilesLink.sh ; echo 'update links' ; }
deopletefsharp () { cd ~/.cache/dein/repos/github.com/callmekohei/deoplete-fsharp ; }

bashrc () { vim ~/dotfiles/bash/.bashrc ; }
bashlocalrc () { vim ~/dotfiles/bash/bashlocalrc.bash ; }
vimrc () { vim ~/dotfiles/vim/init.vim ; }
vimlocalrc () { vim ~/dotfiles/vim/vimlocalrc.vim ; }

deinrc () { vim ~/dotfiles/vim/dein.toml ; }
deinlazyrc () { vim ~/dotfiles/vim/deinlazy.toml; }
memo () { vim ~/tmp/memo.txt ; }
myapp () { cd ~/myApp ; ls -al ; }



