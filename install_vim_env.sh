#!/bin/bash
set -e

echo ">>> 拷贝 .vimrc 到用户目录"
cp .vimrc ~/.vimrc

echo ">>> 安装 vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo ">>> 自动安装插件（PlugInstall）"
vim +PlugInstall +qall

echo ">>> Vim 开发环境安装完成！"

