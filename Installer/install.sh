#!/bin/sh
if ! which git > /dev/null 2>&1; then
    if which yum > /dev/null 2>&1; then
        sudo yum install -y git
    elif which apt-get > /dev/null 2>&1; then
        sudo apt-get install -y git   
    else
        echo "please install git first."
        exit -1
    fi
fi
cd ~
git clone https://github.com/acefei/AceProfile.git
./AceProfile/Installer/set_environment.sh
