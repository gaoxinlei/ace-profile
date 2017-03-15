#!/usr/bin/bash
source $(cd `dirname $0`; pwd)/precondition.sh

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
source $(dirname $0)/verify_pip.sh
$PIP jedi
(vim +PlugClean! +PlugInstall! +qa)
