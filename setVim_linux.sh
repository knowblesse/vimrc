#!/bin/bash
echo "Welcome Knowblesse!"
echo "automatically Setting Vim file for you"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/VCF/vimrc/_vimrc ~/.vimrc
cp ~/VCF/vimrc/monokai.vim ~/.vim/colors/monokai.vim
