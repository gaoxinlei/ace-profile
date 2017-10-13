#!/usr/bin/bash
INSTALLATION_PATH=~/ace-profile/Installer/
source  $INSTALLATION_PATH/precondition.sh

setup_git()
{
    echo
    echo ">>>>>  Setup git-completion..."
    $DOWNLOADER ~/.git-completion.bash         https://raw.github.com/git/git/master/contrib/completion/git-completion.bash 
    echo
    echo ">>>>>  Setup git-prompt..."
    $DOWNLOADER ~/.git-prompt.sh               https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
    echo
    echo ">>>>>  Setup git-flow..."
    $DOWNLOADER ~/.git-flow-completion.bash    https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash

    git config --global merge.tool meld
    git config --global diff.tool meld
}

setup_bash_profile()
{
    echo
    echo ">>>>>  Setup bash profile..."
    echo > $profile
    for f in $BashProfile/_*
    do
        echo "source $f in $profile"
        echo "source $f" >> $profile
    done

    [ -e $bashrc ] && mv $bashrc ${bashrc}.backup
    ln -sf $profile $bashrc
}

setup_vimrc()
{
    echo
    echo ">>>>>  Setup vim resource..."
    [ -e $vimrc -o -h $vimrc ] && mv $vimrc ${vimrc}.backup
    [ -e $ideavimrc -o -h $ideavimrc ] && mv $ideavimrc ${ideavimrc}.backup
    ln -s $Vimrcs/_vimrc_without_pulgin $vimrc
    ln -s $Vimrcs/_ideavimrc $ideavimrc
}

##################### MAIN ##########################
setup_git
setup_bash_profile
setup_vimrc

VAR='N'
read -p "Could you want to furture install for git/vim extension?[y/N]" var
[ "$var" == '' ] || VAR=$(echo $var | tr 'a-z' 'A-Z')
if [ "$VAR" != 'N' ]; then
   $INSTALLATION_PATH/install_vim_extension.sh
   $INSTALLATION_PATH/install_git_extension.sh
fi

source $INSTALLATION_PATH/rear_echo.sh