#!/usr/bin/bash

SUPPORT=(CENTOS UBUNTU)
RELEASE_FILE=~/.release_info
rm -f $RELEASE_FILE
for release in $SUPPORT
do
    if cat /etc/*release | grep -i $release
    then
        echo $release > ~/.release_info
        break
    fi
done

if [ ! -e $RELEASE_FILE ];then
    echo "[Error] Unknow OS!!!"
    exit -1
fi

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
