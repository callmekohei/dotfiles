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
    cd $( dirname ${foo} )
    cd $( dirname ${bar} )
    cd ..
    s0='tell application "Finder" to make alias file to POSIX file'
    s1='"'$( pwd -P )'/MacVim.app''"'
    s2='at POSIX file "/Applications"'
    echo "'"${s0}' '${s1}' '${s2}"'" | xargs osascript -e > /dev/null 2>&1
}

function create_alias_macvim {

    RES=`find /Applications -maxdepth 1 -name MacVim.* 2>/dev/null`
    if [ $? -ne 0 ]; then
      echo 'error! please check MacVim aliase.'
    elif [ -z "$RES" ]; then
      create_alias_macvim_impl
    else
      rm /Applications/MacVim.*
      create_alias_macvim_impl
    fi
}

create_alias_macvim
