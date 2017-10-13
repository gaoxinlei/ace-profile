#!/usr/bin/bash

SUPPORT=(CENTOS UBUNTU)

ACE_PROFILE_ENV=$HOME/.ace_profile_env
cat > $ACE_PROFILE_ENV <<EOF
	RELEASE_FILE=$HOME/.release_info
	INSTALL_PATH=$HOME/.myprofile
EOF

source $ACE_PROFILE_ENV
rm -f $RELEASE_FILE

for release in ${SUPPORT[@]}
do
    echo $release
    if cat /etc/*release | grep -i $release > /dev/null 2>&1
    then
        echo $release > $RELEASE_FILE
        break
    fi
done

if [ ! -e $RELEASE_FILE ];then
    echo "[Error] Sorry! Now Only support ${SUPPORT[*]}!"
    exit -1
fi

if ! which git > /dev/null 2>&1; then
    echo "please install git first."
    exit -1
fi

git clone -b dev https://github.com/acefei/ace-profile.git $INSTALL_PATH
$INSTALL_PATH/installer/common.sh
