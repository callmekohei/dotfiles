# ===========================================================================
#  FILE    : bash_profile
#  AUTHOR  : callmekohei <callmekohei at gmail.com>
# ===========================================================================

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


#-------------------------------------------------------------
#  Util
#-------------------------------------------------------------

# see also: http://wiki.bash-hackers.org/scripting/terminalcodes#foreground_coloring
BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
PURPLE="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
GRAY="\[$(tput setaf 8)\]"
RESET="\[$(tput sgr0)\]"

function ArrJoin () {
    local IFS="$1"
    shift
    echo "$*"
}


#-------------------------------------------------------------
#  Language
#-------------------------------------------------------------

# see also: http://pubs.opengroup.org/onlinepubs/7908799/xbd/envvar.html
export LANG=en_us.UTF-8
export LESSCHARSET=utf-8
export LC_ALL=$LANG
export LC_ALLLANG=$LANG
export LC_CTYPE=$LANG
export POL_LANG=en.utf-8


#-------------------------------------------------------------
#  General path
#-------------------------------------------------------------

# MacOSX already set path by path_helper.
# see also: http://takuya-1st.hatenablog.jp/entry/2013/12/14/040814
# $ man -k path_helper
# $ man path_helper 8

function setExtraPath () {

    local cellar=/usr/local/bin
    export PATH="${cellar}":"${PATH}"

    local openssl=/usr/local/opt/openssl/bin
    export PATH="${openssl}":"${PATH}"

}

setExtraPath


#-------------------------------------------------------------
#  ENVIRONMENT
#-------------------------------------------------------------

export EDITOR=/usr/local/bin/vim
export MONO_GAC_PREFIX=/usr/local
export WINEPREFIX=~/.wine
export XDG_CONFIG_HOME=~/.config
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --ansi'

#-------------------------------------------------------------
#  Change Prompt
#-------------------------------------------------------------

# see also: https://wiki.archlinux.jp/index.php/Bash/%E3%83%97%E3%83%AD%E3%83%B3%E3%83%97%E3%83%88%E3%81%AE%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA

function parse_git_branch () {
    git branch --no-color 2> /dev/null \
    | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

function prompt () {

    local arr=(
        '\n'
        ${BLUE}'\W'
        ${GREEN}'$( parse_git_branch )'
        '\n'
        ${BLUE}'\$'
        ${RESET}' '
    )
    export PS1=$( ArrJoin '' "${arr[@]}" )
}

prompt
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


#-------------------------------------------------------------
#  Auto-complete
#-------------------------------------------------------------

# brew info bash-completion@2
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi


#-------------------------------------------------------------
#  Git / Github
#-------------------------------------------------------------

function gittree () {

    local arr=(
        --oneline
        --graph
        --all
        "--format=%x09 %Cred%h %Cgreen%cd %Cblue%s %d"
    )

    git log "${arr[@]}"
}

eval "$(hub alias -s)"


#-------------------------------------------------------------
#  Search
#-------------------------------------------------------------

# see also: https://natelandau.com/my-mac-osx-bash_profile/
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff  () { /usr/bin/find . -name "$@" ; }     # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


#-------------------------------------------------------------
#  rc files
#-------------------------------------------------------------

function rc_copy () {
    local dotfiles=~/dotfiles
    if [ ! -e ${dotfiles} ] ; then
        mkdir ${dotfiles}
    fi

    # bash files
    cp ~/.bash_profile ${dotfiles}
    cp ~/.bashrc ${dotfiles}
    cp ~/.inputrc ${dotfiles}

    # vim files
    cp ~/.config/nvim/init.vim ${dotfiles}
    cp ~/.config/nvim/dein.toml ${dotfiles}
    cp ~/.config/nvim/dein_lazy.toml ${dotfiles}
}


function check_vimrc_linked () {

    local vimrc=~/.vimrc
    local initVim=${XDG_CONFIG_HOME}/nvim/init.vim

    if [ ! -e ${vimrc} ] ; then
        echo 'foo'
        ln -s ${initVim} ${vimrc}
    elif ! readlink ${vimrc} > /dev/null 2>&1 ; then
        echo 'bar'
        rm ${vimrc}
        ln -s ${initVim} ${vimrc}
    elif [ $( readlink ${vimrc} ) != ${initVim} ] ; then
        echo 'baz'
        rm ${vimrc}
        ln -s ${initVim} ${vimrc}
    fi

}

rc_copy
check_vimrc_linked

bashrc   () { vim ~/.bash_profile ; }
vimrc    () { vim ~/.config/nvim/init.vim ; }
deinrc   () { vim ~/.config/nvim/dein.toml ; }
deinlazy () { vim ~/.config/nvim/dein_lazy.toml ; }


#-------------------------------------------------------------
#  Local setting
#-------------------------------------------------------------

export PYTHONPATH=~/tmp/pdb/
export SDB_PATH=~/tmp/sdbplg/bin/
alias loto6="cd ~/tmp/lotofs/bin/ ; mono main_binary.exe   ; cd -"
alias loto7="cd ~/tmp/lotofs/bin/ ; mono main_binary.exe 7 ; cd -"
alias mql='cd "~/.wine/drive_c/Program Files/OANDA - MetaTrader/MQL4/Scripts"'


#-------------------------------------------------------------
#  Second Home Folder
#-------------------------------------------------------------

function goto_2nd_home_folder () {
    if [ ! -e $HOME/tmp/ ] ; then
        mkdir ./tmp/
    fi

    cd $HOME/tmp/
}

goto_2nd_home_folder
