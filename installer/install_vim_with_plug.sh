#!/usr/bin/bash
current_dir=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
source $current_dir/precondition.sh

CENTOS()
{
    $YUMG "Development tools"
    $YUM yum install ncurses-devel python-devel lua-devel
}

UBUNTU()
{
    $APTGET update
    $APTGET vim build-essential exuberant-ctags python-dev lua-dev
}

INSTALL_VIM()
{
    source $current_dir/verify_pip.sh
    $PIP jedi

    cd /tmp
    #git clone https://github.com/vim/vim.git
    curl -O ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2
    tar xf vim-*.tar.bz2
    cd vim*/
    ./configure --prefix=/usr --with-features=huge \
        --enable-rubyinterp  \
        --enable-pythoninterp \
        --enable-luainterp

    make && sudo make install
    cd .. && rm -rf vim*/
}

$RELEASE
#INSTALL_VIM

[ -e $vimrc -o -h $vimrc  ] && mv $vimrc ${vimrc}.backup
ln -s $vimrcs/_vimrc $vimrc
vim +PlugClean! +PlugInstall! +qa
source $current_dir/rear_echo.sh
