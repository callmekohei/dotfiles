# .bashrc

# Set extra path {{{

# MacOSX already set path by path_helper.
# $ man path_helper 8
function setExtraPath () {

    local homebrew=/usr/local/bin
    export PATH="${homebrew}":"${PATH}"

    local openssl=/usr/local/opt/openssl/bin
    export PATH="${openssl}":"${PATH}"

}

setExtraPath

# }}}

# ENVIRONMENT {{{

export EDITOR=vim

# ( language )
export LANG=en_us.UTF-8
export LESSCHARSET=utf-8
export LC_ALL=$LANG
export LC_ALLLANG=$LANG
export LC_CTYPE=$LANG
export POL_LANG=en.utf-8

# ( ls )
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ( less )
export LESS='-g -i -M -R -S -W -z-4 -x4'
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[00;47;30m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# }}}

# Load files for Completions {{{

# Bash's auto-complete is already implimented. ( requires > 4.x )
function bashComplete () {

    # Load extra complete config files
    local dir=$(brew --prefix)/etc/bash_completion.d
    local file
    for file in ${dir}/* ; do
        [ -r "$file" ] && source "$file"
    done
    unset file

}

bashComplete

# }}}

# Prompt{{{
function set_prompts () {

    # colors
    local black="\[$(  tput setaf 0)\]"
    local blue="\[$(   tput setaf 4)\]"
    local cyan="\[$(   tput setaf 6)\]"
    local gray="\[$(   tput setaf 8)\]"
    local green="\[$(  tput setaf 2)\]"
    local purple="\[$( tput setaf 5)\]"
    local red="\[$(    tput setaf 1)\]"
    local reset="\[$(  tput sgr0)\]"
    local white="\[$(  tput setaf 7)\]"
    local yellow="\[$( tput setaf 3)\]"

    # Automatically trim long paths in the prompt (requires Bash 4.x)
    PROMPT_DIRTRIM=2

    # see also: $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    # unstaged (*) and staged (+)
    GIT_PS1_SHOWDIRTYSTATE="auto"
    # untacked (%)
    GIT_PS1_SHOWUNTRACKEDFILES="auto"
    # behind (<), ahead (>), diverged (<>) and no difference (=)
    GIT_PS1_SHOWUPSTREAM="auto"

    # prompt string
    PS1='\n'
    PS1+=${blue}'\w'
    PS1+=${green}'$( __git_ps1 )'
    PS1+=${reset}'\n'
    PS1+='\$ '
    export PS1

    # Subshell prompt string
    export PS2="> "

    # Debug prompt string  (when using `set -x`)
    export PS4='+ \011\e[1;30m\t\011\e[1;34m${BASH_SOURCE}\e[0m:\e[1;36m${LINENO}\e[0m \011 ${FUNCNAME[0]:+\e[0;35m${FUNCNAME[0]}\e[1;30m()\e[0m:\011\011 }'
}

set_prompts
unset set_prompts

# }}}

# Load .bashlocalrc {{{

function load_bashlocal () {

    local bashlocal=~/dotfiles/bash/bashlocalrc.bash

    if [ -f ${bashlocal}  ]; then
      . ${bashlocal}
    fi
}

load_bashlocal

# }}}

