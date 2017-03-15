#!/bin/sh
if which git > /dev/null 2>&1; then
    echo "please install git first."
    exit -1
fi
cd ~
git clone https://github.com/acefei/AceProfile.git
./AceProfile/Installer/set_environment.sh
