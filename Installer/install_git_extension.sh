#!/usr/bin/bash
source $(cd `dirname ${BASH_SOURCE[0]}`; pwd)/precondition.sh

CENTOS()
{
    $YUM epel-release 
    $YUM update
    echo
    echo ">>>>>  Setup git flow..."
    $YUM gitflow
    echo
    echo ">>>>>  Setup gitk..."
    $YUM gitk xorg-x11-fonts*
    echo
    echo ">>>>>  Setup git-meld..."
    $YUM meld
}

$RELEASE
