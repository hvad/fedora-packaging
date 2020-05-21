#!/usr/bin/env bash

VUNDLE_HTTPS="https://github.com/VundleVim/Vundle.vim.git"

if [ ! -n "$VIM" ]; then
    VIM=~/.vim
fi

mkdir $VIM

if [ ! -d "$VIM/bundle/Vundle.vim" ]; then
    env git clone --depth=1 $VUNDLE_HTTPS "$VIM/bundle/Vundle.vim"
fi

if [ ! -f $VIM/colors/wombat256mod.vim ]; then
    if [ ! -d $VIM/colors/ ]; then
        mkdir -p $VIM/colors
    fi
    wget 'http://www.vim.org/scripts/download_script.php?src_id=13400' -O $VIM/colors/wombat256mod.vim
fi

vim +PluginInstall +quitall

rm -- "$0"
