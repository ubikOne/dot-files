#!/bin/bash

if [ `pip3 freeze | sed '{s/==/ /}' | awk '{print $1}' | grep jedi` == 'jedi'  ]; then
   echo "pip jedi is installed"
else
   sudo pip install jedi
fi  

FILE=/usr/share/fonts/truetype/fira-code
if [ -d "$FILE" ]; then
    echo "Fira Code is installed"
else
   cd /tmp
    8 git clone https://github.com/tonsky/FiraCode.git
    9 sudo mv -i /tmp/FiraCode/distr/ttf /usr/share/fonts/truetype/fira-code
   10 sudo fc-cache -fv
fi

FILE=$HOME/.vim/bundle/Vundle.vim
if [ -d "$FILE" ]; then
    echo "$FILE exist"
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

FILE=$HOME/.config/vim/vimrc
if [ -f "$FILE" ]; then
    echo "$FILE exist"
else 
    mkdir $HOME/.config/vim
    cp vimrc $HOME/.config/vim/vimrc
    mv $HOME/.vimrc $HOME/.vimrc.old
    ln -s $HOME/.config/vim/vimrc $HOME/.vimrc
    vim .vimrc -c 'source % | PluginInstall | wq'
fi
