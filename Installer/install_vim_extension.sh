#!/bin/sh

source $(dirname $0)/precondition.sh

CENTOS()
{
    $YUM update
    $YUMG "Development tools"
    $YUM ctags python-devel
}

UBUNTU()
{
    $APTGET update
    $APTGET build-essential exuberant-ctags python-dev
}

$RELEASE
source $(dirname $0)/verify_pip.sh
$PIP jedi
(vim +PlugClean! +PlugInstall! +qa)
