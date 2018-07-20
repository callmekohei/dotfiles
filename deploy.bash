#!/usr/bin/env bash
# -----------------------------
#   callmekohei's deploy.bash
# -----------------------------

FROMDIR="${HOME}"/dotfiles
DISTDIR="${HOME}"

# Shell
ln -sf "${FROMDIR}"/bash/bashrc       "${DISTDIR}"/.bashrc
ln -sf "${FROMDIR}"/bash/bash_profile "${DISTDIR}"/.bash_profile
ln -sf "${FROMDIR}"/bash/inputrc      "${DISTDIR}"/.inputrc

# Git/Github
ln -sf ${FROMDIR}/git/gitconfig ${DISTDIR}/.gitconfig

# Ctags
ln -sf ${FROMDIR}/ctags/ctags ${DISTDIR}/.ctags

# Vim/Neovim
ln -sf "${FROMDIR}"/vim/vimrc                 "${DISTDIR}"/.vim/vimrc
ln -sf "${FROMDIR}"/vim/vimrc                 "${DISTDIR}"/.config/nvim/init.vim
ln -sf "${FROMDIR}"/vim/plugins/dein.toml     "${DISTDIR}"/.config/nvim/dein.toml
ln -sf "${FROMDIR}"/vim/plugins/deinlazy.toml "${DISTDIR}"/.config/nvim/deinlazy.toml

function localSyntax () {

    if [ ! -e "${DISTDIR}"/.vim/syntax ] ; then
        mkdir -p "${DISTDIR}"/.vim/syntax
    fi

    local filePath
    local fileName
    for filePath in "${FROMDIR}"/vim/syntax/* ; do
        fileName=$(basename "${filePath}")
        [ -r "$filePath" ] && ln -sf "${filePath}" "${DISTDIR}"/.vim/syntax/"${fileName}"
    done
    unset file

}

localSyntax
unset localSyntax

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

# template
MEMODIR="${HOME}/Dropbox/memo"
ln -sf ${FROMDIR}/template/memolist/txt.txt ${MEMODIR}/

# dictionary
function localDictionary () {

    if [ ! -e "${DISTDIR}"/.vim/dictionary ] ; then
        mkdir -p "${DISTDIR}"/.vim/dictionary
    fi

    local filePath
    local fileName
    for filePath in "${FROMDIR}"/vim/dictionary/* ; do
        fileName=$(basename "${filePath}")
        [ -r "$filePath" ] && ln -sf "${filePath}" "${DISTDIR}"/.vim/dictionary/"${fileName}"
    done
    unset file

}

localDictionary
unset localDictionary
