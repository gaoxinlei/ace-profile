#!/bin/sh
init()
{
    path=$(cd $(dirname $0); pwd)
    BashProfile=$path/../BashProfile
    Vimrcs=$path/../Vimrcs
    bashrc=$HOME/.bashrc
    profile=$HOME/.bash_profile
    vimrc=$HOME/.vimrc
    ideavimrc=$HOME/.ideavimrc

    download=''
    if which wget >/dev/null 2>&1; then
        download='wget -O '
    elif which curl >/dev/null 2>&1; then
        download='curl -Lo '
    else
        if sudo yum install -y wget > /dev/null 2>&1; then
            download='wget -O '
        elif sudo yum install -y curl > /dev/null 2>&1; then
            download='curl -Lo '
        else
            echo "please install wget or curl manully."
            exit -1
        fi
    fi

    yum_y='sudo yum install -y '
    pip='sudo pip install '

}

setup_development_tools()
{
    echo
    echo ">>>>>  Setup development tools..."
    sudo yum -y groupinstall "Development tools"
    $yum_y python-devel python-pip
    $pip --upgrade pip
}

setup_git_extension()
{
    echo
    echo ">>>>>  Setup git-completion..."
    $download ~/.git-completion.bash         https://raw.github.com/git/git/master/contrib/completion/git-completion.bash 
    echo
    echo ">>>>>  Setup git-prompt..."
    $download ~/.git-prompt.sh               https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
    echo
    echo ">>>>>  Setup git-flow..."
    $yum_y gitflow
    $download ~/.git-flow-completion.bash    https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash
    echo
    echo ">>>>>  Setup gitk..."
    $yum_y gitk  xorg-x11-fonts*
    echo
    echo ">>>>>  Setup git-meld..."
    $yum_y meld
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
        echo "source $f into $profile"
        echo "source $f" >> $profile
    done

    echo "ln -sf $profile $bashrc"
    ln -sf $profile $bashrc
}

setup_vimrc()
{
    echo
    echo ">>>>>  Setup vim resource..."
    if ! which vim >/dev/null 2>&1; then
        $yum_y vim
    fi
    [ -e $vimrc -o -h $vimrc ] && mv $vimrc ${vimrc}.backup
    [ -e $ideavimrc -o -h $ideavimrc ] && mv $ideavimrc ${ideavimrc}.backup
    ln -s $Vimrcs/_vimrc $vimrc
    ln -s $Vimrcs/_ideavimrc $ideavimrc
    $yum_y pylint exuberant-ctags build-essential cmake python-dev
    $pip jedi
    vim +PlugClean! +PlugInstall! +qa
}

##################### MAIN ##########################
init
#setup_development_tools
#setup_git_extension
#setup_bash_profile
setup_vimrc
echo "**********************************************************************************************************"
echo "*************** Installation complete, please source ~/.bash_profile to enable the profile ***************"
echo "**********************************************************************************************************"
