init()
{
    path=$(cd $(dirname $0); pwd)
    BashProfile=$path/../BashProfile
    VimrcWithoutPlugin=$path/VimrcWithoutPlugin
    bashrc=$HOME/.bashrc
    profile=$HOME/.bash_profile

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

}

setup_development_tools()
{
    echo
    echo ">>>>>  Setup development tools..."
    sudo yum -y groupinstall "Development tools"
    sudo yum install -y python-devel
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

setup_vim()
{
    echo
    echo ">>>>>  Setup vim resource..."
    if ! which vim >/dev/null 2>&1; then
        $yum_y vim
    fi

    vimrc=$HOME/.vimrc
    ideavimrc=$HOME/.ideavimrc
    [ -f $vimrc ] || ln -s $VimrcWithoutPlugin/_vimrc $vimrc
    [ -f $ideavimrc ] || ln -s $VimrcWithoutPlugin/_ideavimrc $ideavimrc
}

setup_pip()
{
    echo
    echo ">>>>>  Setup python-pip..."
    $yum_y python-pip
    sudo pip install --upgrade pip
}


init
setup_development_tools
setup_git_extension
setup_bash_profile
setup_vim
setup_pip
echo
echo "*************** Installation complete, please source ~/.bash_profile to enable the profile ***************"
