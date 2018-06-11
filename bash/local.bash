# bashlocal.bash

# second home {{{
    if [ ! -e $HOME/tmp/ ] ; then
        mkdir ./tmp/
    fi
    cd $HOME/tmp/
# }}}

# util alias {{{
    alias la='ls -a'
    alias ll='ls -a -l'
    alias cd..='cd ..'
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

dotfile () { cd ~/dotfiles ; }
deploy () { bash ~/dotfiles/deploy.bash ; echo 'update links' ; }

bashrc () { vim ~/dotfiles/bash/local.bash ; }
vimrc  () { vim ~/dotfiles/vim/rc/local.rc.vim ; }
deinrc () { vim ~/dotfiles/vim/rc/dein/dein*toml ; }

memo () { cd ~/tmp/memo_folder ; vim ~/tmp/memo_folder/memo.txt ; }
myapp () { cd ~/myApp ; ls; }
deopletefsharp () { cd ~/.cache/dein/repos/github.com/callmekohei/deoplete-fsharp ; }

function v () {
    vim -N -u $HOME/tmp/minimal.vimrc $1
}

dictionary () { cd ~/tmp/mydictionary ; }
