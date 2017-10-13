#!/usr/bin/bash
source $HOME/.ace_profile_env

INSTALLER=$INSTALL_PATH/installer
source $INSTALLER/precondition.sh

setup_git()
{
    pushd $HOME
    echo
    echo ">>>>>  Setup git-completion..."
    $DOWNLOADER https://raw.github.com/git/git/master/contrib/completion/git-completion.bash 
    echo
    echo ">>>>>  Setup git-prompt..."
    $DOWNLOADER https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
    echo
    echo ">>>>>  Setup git-flow..."
    $DOWNLOADER https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash
    popd

    git config --global merge.tool meld
    git config --global diff.tool meld
}

setup_bash_profile()
{
    echo
    echo ">>>>>  Setup bash profile..."
    echo > $profile
    for f in $bash_profile/_*
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
    ln -s $vimrcs/_vimrc_without_pulgin $vimrc
    ln -s $vimrcs/_ideavimrc $ideavimrc
}

##################### MAIN ##########################
setup_git
setup_bash_profile
setup_vimrc

VAR='N'
read -p "Could you want to furture install for git/vim extension?[y/N]" var
[ "$var" == '' ] || VAR=$(echo $var | tr 'a-z' 'A-Z')
if [ "$VAR" != 'N' ]; then
   $INSTALLER/install_git_extension.sh
   $INSTALLER/install_vim_with_plug.sh
fi

source $INSTALLATION_PATH/rear_echo.sh
