#!/usr/bin/bash
current_dir=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
source $current_dir/precondition.sh

CENTOS()
{
    $YUMG "Development tools"
    $YUM yum install ncurses-devel python-devel 
}

UBUNTU()
{
    $APTGET update
    $APTGET build-essential exuberant-ctags python-dev ncurses-dev
}

INSTALL_VIM()
{
    cd /tmp
    #git clone https://github.com/vim/vim.git
    curl -O ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2 
    tar xf vim-*.tar.bz2
    cd vim*/
    ./configure --prefix=/usr --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-luainterp
    make && sudo make install
    cd .. && rm -rf vim*/
}

INSTALL_VIM_SPACE()
{
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
}

$RELEASE
INSTALL_VIM
INSTALL_VIM_SPACE


