#!/bin/sh

RELEASE=$(head -1 /etc/issue | cut -d ' ' -f1 | tr 'a-z' 'A-Z')
# current work directory
CWD=$(cd $(dirname $0); pwd)
DOWNLOADER='curl -Lo '

# defined known package manager tools 
YUM='yum install -y '
YUMG='yum groupinstall -y '
APTGET='apt-get install -y '
PIP='pip install'

BashProfile=$CWD/../BashProfile
Vimrcs=$CWD/../Vimrcs

bashrc=$HOME/.bashrc
profile=$HOME/.bash_profile
vimrc=$HOME/.vimrc
ideavimrc=$HOME/.ideavimrc
