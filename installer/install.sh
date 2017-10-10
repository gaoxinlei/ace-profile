#!/usr/bin/bash

SUPPORT=(CENTOS UBUNTU)
RELEASE_FILE=~/.release_info
rm -f $RELEASE_FILE

for release in ${SUPPORT[@]}
do
    echo $release
done
exit
tmp=$(mktemp)
cd $tmp
cat /etc/*release > release_info
if grep -i "CENTOS" release_info > /dev/null; then
    yum install -y git
    echo "CENTOS" > $RELEASE_FILE
elif grep -i "UBUNTU" release_info > /dev/null; then
    echo "UBUNTU" > $RELEASE_FILE
fi






for release in $SUPPORT
do
    if cat /etc/*release | grep -i $release > /dev/null 2>&1
    then
        echo $release > ~/.release_info
        break
    fi
done

if [ ! -e $RELEASE_FILE ];then
    echo "[Error] Sorry! Now Only support ${SUPPORT[*]}!"
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
git clone https://github.com/acefei/ace-profile.git
./ace-profile/Installer/set_environment.sh
