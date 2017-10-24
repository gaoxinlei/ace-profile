#!/usr/bin/bash

source $(cd `dirname ${BASH_SOURCE[0]}`; pwd)/precondition.sh

if which pip > /dev/null 2>&1; then
   return 0
fi

CENTOS()
{
   $YUM python-pip
}

UBUNTU()
{
   $APTGET python-pip
}

$RELEASE
sudo cat > /etc/pip.conf <<EOF
[global]
index-url = https://pypi.doubanio.com/simple
EOF
$PIP --upgrade pip 
