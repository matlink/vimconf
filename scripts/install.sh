#! /bin/bash

# Get this folder dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

# Backup old vimrc
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.bak
[ -d ~/.vim ]   && mv ~/.vim   ~/.vim.bak

# Make symlinks
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/vim   ~/.vim
