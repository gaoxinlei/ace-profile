#!/usr/bin/bash

release_info=~/.release_info
[ -f $release_info ] || echo "CENTOS" > $release_info
RELEASE=$(cat $release_info | tr 'a-z' 'A-Z')

CWD=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
DOWNLOADER='curl -sLO '

# defined known package manager tools 
YUM='sudo yum install -y '
YUMG='sudo yum groupinstall -y '
APTGET='sudo apt-get install -y '
PIP='sudo pip install'

bash_profile=$CWD/../bash_profile
vimrcs=$CWD/../vimrcs

bashrc=$HOME/.bashrc
profile=$HOME/.bash_profile
vimrc=$HOME/.vimrc
ideavimrc=$HOME/.ideavimrc

