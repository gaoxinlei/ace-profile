#!/usr/bin/bash
sudo pip install virtualenv virtualenvwrapper

# To tell pip to only run if there is a virtualenv currently activated
alias vpip='env PIP_REQUIRE_VIRTUALENV=true pip '

#Not having access to global site-packages is now the default behavior.
alias mkv='mkvirtualenv --no-site-packages '
alias lsv='lsvirtualenv '
alias rmv='rmvirtualenv '
alias quitv='deactivate '

# setup virutalenv 
export WORKON_HOME=~/python_projects
if [ ! -d $WORKON_HOME ];then
    mkdir $WORKON_HOME
fi

vw=`which virtualenvwrapper.sh`
[ -n "$vw" ] && source $vw

wo()
{
    # Usage:
    # $wo
    # >>> List Virtaulenv
    # robotframework

    # >>> Please select one to workon: robotframework

    local env_name=$1
    echo '>>> List Virtaulenv'
    lsvirtualenv -b
    echo
    read -p ">>> Please select one to workon: " env_name
    workon $env_name
    cd $WORKON_HOME/$env_name
}
