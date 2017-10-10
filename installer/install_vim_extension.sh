#!/usr/bin/bash
current_dir=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
source $current_dir/precondition.sh

CENTOS()
{
    $YUM epel-release
    $YUM update
    $YUMG "Development tools"
    $YUM vim ctags python-devel
}

UBUNTU()
{
    $APTGET update
    $APTGET vim build-essential exuberant-ctags python-dev
}

$RELEASE
source $current_dir/verify_pip.sh
$PIP jedi

[ -e $vimrc -o -h $vimrc  ] && mv $vimrc ${vimrc}.backup
ln -s $Vimrcs/_vimrc $vimrc
sed -i '/vi=/s/^#//' $BashProfile/_alias
(vim +PlugClean! +PlugInstall! +qa)

source $current_dir/rear_echo.sh
