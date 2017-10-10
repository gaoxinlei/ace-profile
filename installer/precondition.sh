#!/usr/bin/bash

RELEASE=$(cat ~/.release_info | tr 'a-z' 'A-Z')

CWD=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
DOWNLOADER='curl -Lo '

# defined known package manager tools 
YUM='sudo yum install -y '
YUMG='sudo yum groupinstall -y '
APTGET='sudo apt-get install -y '
PIP='sudo pip install'

BashProfile=$CWD/../BashProfile
Vimrcs=$CWD/../Vimrcs

bashrc=$HOME/.bashrc
profile=$HOME/.bash_profile
vimrc=$HOME/.vimrc
ideavimrc=$HOME/.ideavimrc

