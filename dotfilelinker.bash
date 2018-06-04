#!/usr/bin/env bash

FROMDIR=$HOME/dotfiles
DISTDIR=$HOME

# Shell
ln -sf ${FROMDIR}/bash/bashrc  ${DISTDIR}/.bashrc
ln -sf ${FROMDIR}/bash/profile ${DISTDIR}/.bash_profile
ln -sf ${FROMDIR}/bash/inputrc ${DISTDIR}/.inputrc

# Git/Github
ln -sf ${FROMDIR}/git/gitconfig ${DISTDIR}/.gitconfig

# Vim/Neovim
ln -sf ${FROMDIR}/vim/vimrc                ${DISTDIR}/.vimrc
ln -sf ${FROMDIR}/vim/vimrc                ${DISTDIR}/.config/nvim/init.vim
ln -sf ${FROMDIR}/vim/vimrcs/dein.toml     ${DISTDIR}/.config/nvim/dein.toml
ln -sf ${FROMDIR}/vim/vimrcs/deinlazy.toml ${DISTDIR}/.config/nvim/deinlazy.toml

# MacVim
ln -fs ${FROMDIR}/vim/gvimrc ${DISTDIR}/.gvimrc

function create_alias_macvim_impl {

    local foo=$( type -P mvim )
    local bar=$( readlink ${foo} )

    str=$(
        cd $( dirname ${foo} )
        cd $( dirname ${bar} )
        cd ..
        pwd -P
    )

    s="'"
    s+='tell application "Finder" to make alias file to POSIX file'
    s+=' "'
    s+=${str}/MacVim.app
    s+='" '
    s+='at POSIX file "/Applications"'
    s+="'"

    echo "${s}" | xargs osascript -e > /dev/null 2>&1
}

function create_alias_macvim {

    local tmp=`find /Applications -maxdepth 1 -name MacVim.* 2>/dev/null`
    if [ $? -ne 0 ]; then
        echo 'error! please check MacVim aliase.'
    elif [ -z "$tmp" ]; then
        create_alias_macvim_impl
    else
        rm /Applications/MacVim.*
        sleep 0.5 # to avoid create file 'MacVim.app alias'
        create_alias_macvim_impl
    fi
}

create_alias_macvim
