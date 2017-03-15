#!/usr/bin/bash

source $(cd `dirname $0`; pwd)/precondition.sh

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
$PIP --upgrade pip 
