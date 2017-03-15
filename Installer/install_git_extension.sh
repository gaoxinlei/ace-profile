#!/bin/sh
source $(dirname $0)/precondition.sh

CENTOS()
{
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
