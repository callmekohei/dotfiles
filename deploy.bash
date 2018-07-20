# !/usr/bin/env bash
# callmekohei's deploy.bash

FROMDIR="${HOME}/dotfiles"
VimHOME="${HOME}/.vim"
NvimHOME="${HOME}/.config/nvim"

# rc files {{{

  function rcFiles () {

    # Shell
    ln -sf "${FROMDIR}"/bash/bashrc        "${HOME}"/.bashrc
    ln -sf "${FROMDIR}"/bash/bash_profile  "${HOME}"/.bash_profile
    ln -sf "${FROMDIR}"/bash/inputrc       "${HOME}"/.inputrc

    # Git/Github
    ln -sf ${FROMDIR}/git/gitconfig ${HOME}/.gitconfig

    # Ctags
    ln -sf ${FROMDIR}/ctags/ctags ${HOME}/.ctags

    # Vim/Neovim
    ln -sf "${FROMDIR}"/vim/vimrc                 "${VimHOME}"/vimrc
    ln -sf "${FROMDIR}"/vim/vimrc                 "${NvimHOME}"/init.vim
    ln -sf "${FROMDIR}"/vim/plugins/deinlazy.toml "${NvimHOME}"/deinlazy.toml

  }

  rcFiles
  unset rcFiles

#}}}
# rc local files {{{

  function rcLocalFiles () {

    local foo=$1
    local bar=$2

    if [ -e "${foo}"/"${bar}" ] ; then
      rm -rf "${foo}"/"${bar}"
    fi

    mkdir "${foo}"/"${bar}"

    local filePath
    local fileName

    for filePath in "${FROMDIR}"/vim/"${bar}"/* ; do
      fileName=$(basename "${filePath}")
      [ -r "$filePath" ] && ln -sf "${filePath}" "${foo}"/"${bar}"/"${fileName}"
    done

    unset foo
    unset bar
    unset filePath
    unset fileName

  }

  rcLocalFiles $VimHOME  syntax
  rcLocalFiles $VimHOME  dictionary
  rcLocalFiles $NvimHOME syntax
  rcLocalFiles $NvimHOME dictionary
  unset rcLocalFiles

# }}}
# create MacVim alias {{{

  function create_alias_macvim_impl {

    local foo=$( type -P mvim )
    local bar=$( readlink ${foo} )

    local str=$(
      cd $( dirname "${foo}" )
      cd $( dirname "${bar}" )
      cd ..
      pwd -P
    )

    local s=''
    s+="'"
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

    unset tmp

  }

  create_alias_macvim
  unset create_alias_macvim

# }}}
# template {{{

  ln -sf ${FROMDIR}/template/memolist/txt.txt ${HOME}/Dropbox/memo

# }}}
# __END__  "{{{1

  # vim: expandtab softtabstop=2 shiftwidth=2
  # vim: foldmethod=marker
  # vim: foldcolumn=3
