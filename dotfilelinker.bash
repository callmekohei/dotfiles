#!/usr/bin/env bash

FROMDIR="${HOME}"/dotfiles
DISTDIR="${HOME}"

# Shell
ln -sf "${FROMDIR}"/bash/.bashrc       "${DISTDIR}"/.bashrc
ln -sf "${FROMDIR}"/bash/.bash_profile "${DISTDIR}"/.bash_profile
ln -sf "${FROMDIR}"/bash/.inputrc      "${DISTDIR}"/.inputrc

# Git/Github
ln -sf ${FROMDIR}/git/.gitconfig ${DISTDIR}/.gitconfig

# Vim/Neovim
ln   -sf "${FROMDIR}"/vim/vimrc            "${DISTDIR}"/.vimrc
ln   -sf "${FROMDIR}"/vim/init.vim         "${DISTDIR}"/.config/nvim/init.vim
ln   -sf "${FROMDIR}"/vim/rc/dein.toml     "${DISTDIR}"/.config/nvim/dein.toml
ln   -sf "${FROMDIR}"/vim/rc/deinlazy.toml "${DISTDIR}"/.config/nvim/deinlazy.toml

# MacVim
ln -fs "${FROMDIR}"/vim/gvimrc "${DISTDIR}"/.gvimrc

function create_alias_macvim_impl {

    local foo=$( type -P mvim )
    local bar=$( readlink ${foo} )

    local str=$(
        cd $( dirname "${foo}" )
        cd $( dirname "${bar}" )
        cd ..
        pwd -P
    )

    local s="'"
    s+='tell application "Finder" to make alias file to POSIX file'
    s+=' "'
    s+=${str}/MacVim.app
    s+='" '
    s+='at POSIX file "/Applications"'
    s+="'"

    echo "${s}" | xargs osascript -e > /dev/null 2>&1
}

function create_alias_macvim {

    local tmp=$( find /Applications -maxdepth 1 -name MacVim.* 2>/dev/null )
    if [ $? -ne 0 ]; then
        echo 'error! please check MacVim alias.'
    elif [ -z "${tmp}" ]; then
        create_alias_macvim_impl
    else
        rm /Applications/MacVim.*
        create_alias_macvim_impl
    fi
}

create_alias_macvim
