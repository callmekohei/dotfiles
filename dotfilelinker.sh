#!/usr/bin/env sh

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

